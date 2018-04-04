set :application, "myapp"
set :repository,  "git@github.com:tkuchiki/example-capistrano-deploy-via-bastion.git"
set :deploy_private_key, "docker/ssh/id_rsa"
set :ssh_proxy_command_base, "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

require 'capistrano/ext/multistage'

namespace :bastion do
  desc "hostname"
  task :hostname, roles => :app do
    run "hostname > /tmp/hostname"
  end
end
