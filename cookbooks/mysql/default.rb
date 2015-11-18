package 'mysql-server'
package 'mysql-client'

remote_file "/etc/mysql/conf.d/character_set.cnf" do
  source "files/etc/mysql/conf.d/character_set.cnf"
end

remote_file "/etc/mysql/conf.d/utf8mb4.cnf" do
  source "files/etc/mysql/conf.d/utf8mb4.cnf"
end

service 'mysql' do
  action [:enable]
end

execute "allow remote host access" do
  command "mysql -e \"grant all privileges on *.* to root@'192.168.%'\"";
end

execute "mysql -u root -e \"SET PASSWORD=PASSWORD('#{node['mysql']['password']}');\"" do
  command "mysql -u root -e \"SET PASSWORD=PASSWORD('#{node['mysql']['password']}');\""
end
