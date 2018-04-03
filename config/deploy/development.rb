require "net/ssh/proxy/command"

# localhost -> bastion              -> remote server
# localhost -> alice@127.0.0.1:8022 -> bob@172.20.0.3:22
role :app, "172.20.0.3",
     user: "bob",
     # https://net-ssh.github.io/ssh/v2/api/classes/Net/SSH.html#M000002
     ssh_options: {
       port: 22,
       keys: fetch(:deploy_private_key),
       # :paranoid is deprecated, please use :verify_host_key. Supported values are exactly the same, only the name of the option has changed.
       # Both :paranoid and :verify_host_key were specified. :verify_host_key takes precedence, :paranoid will be ignored.
       #paranoid: false,
       verify_host_key: false,
       #user_known_hosts_file: %w(/dev/null),
       proxy: Net::SSH::Proxy::Command::new("#{fetch(:ssh_proxy_command_base)} alice@127.0.0.1 -p 8022 -W %h:%p -i #{fetch(:deploy_private_key)}"),
     }

