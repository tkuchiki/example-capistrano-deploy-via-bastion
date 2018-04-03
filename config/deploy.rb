set :application, "myapp"
set :repository,  "git@github.com:tkuchiki/example-capistrano-deploy-via-bastion.git"
set :deploy_private_key, "docker/ssh/id_rsa"
set :ssh_proxy_command_base, "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

namespace :bastion do
  desc "print hostname"
  task :test do
    on roles(:app) do
      execute "hostname > /tmp/hostname"
    end
  end
end
