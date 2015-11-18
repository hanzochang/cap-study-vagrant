service "nginx"

package 'nginx' do
  action :install
  user "root"
end

remote_file "/etc/nginx/conf.d/nginx.conf" do
  source "templates/etc/nginx/conf.d/default.conf"
  user "root"
end

remote_file "/etc/nginx/sites-available/default" do
  source "templates/etc/nginx/sites-available/default"
  user "root"
end

service 'nginx' do
  action [:enable, :start]
  user "root"
end
