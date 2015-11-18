include_recipe "rbenv::system"

execute 'chown -R username:username .rbenv' do
  command "chown -R #{node["ubuntu-env"]["username"]}:#{node["ubuntu-env"]["username"]} /home/#{node["ubuntu-env"]["username"]}/.rbenv"
end
