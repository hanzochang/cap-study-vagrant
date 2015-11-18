execute 'sudo apt-get update' do
  command 'sudo apt-get update'
end

package 'git' do
  action :install
end

package 'bundler' do
  action :install
end

execute 'mkdir /tmp/itamae_tmp' do
  command "sudo mkdir /tmp/itamae_tmp"
  not_if "test -d /tmp/itamae_tmp"
end

execute 'chown username:username /tmp/itamae_tmp' do
  command "chown -R #{node["ubuntu-env"]["username"]}:#{node["ubuntu-env"]["username"]} /tmp/itamae_tmp"
end

execute 'mkdir apps / chown apps' do
  command "sudo mkdir /var/apps ; chown -R #{node["ubuntu-env"]["username"]}:#{node["ubuntu-env"]["username"]} /var/apps"
end

execute "touch /var/apps/current" do
  command "sudo mkdir /var/apps/dummy ; sudo ln -s /var/apps/dummy /var/apps/current"
end

execute "sudo rm /var/www" do
  command "sudo rm -rf /var/www"
end

execute "sudo ln -s /var/apps/current /var/www" do
  command "sudo ln -s /var/apps/current /var/www"
end
