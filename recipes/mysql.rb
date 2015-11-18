package "gcc"
package 'mysql-server'

service 'mysql' do
  action [:enable]
end

remote_file "/etc/mysql/conf.d/character_set.conf" do
  source "files/etc/mysql/conf.d/character_set.conf"
end

remote_file "/etc/mysql/conf.d/utf8mb4.conf" do
  source "files/etc/mysql/conf.d/utf8mb4.conf"
end

execute "allow remote host access" do
  # MySQLにリモートホストから接続できるようにする
  command "mysql -e \"grant all privileges on *.* to root@'192.168.%'\"";
end

# package 'libssl-dev'

# RBENV_DIR = "/usr/local/rbenv"
# RBENV_SCRIPT = "/etc/profile.d/rbenv.sh"

# git RBENV_DIR do
  # repository "git://github.com/sstephenson/rbenv.git"
# end

# remote_file RBENV_SCRIPT do
  # source "remote_files/rbenv.sh"
# end

# execute "set owner and mode for #{RBENV_SCRIPT} " do
  # command "chown root: #{RBENV_SCRIPT}; chmod 644 #{RBENV_SCRIPT}"
  # user "root"
# end

# execute "mkdir #{RBENV_DIR}/plugins" do
  # not_if "test -d #{RBENV_DIR}/plugins"
# end

# git "#{RBENV_DIR}/plugins/ruby-build" do
  # repository "git://github.com/sstephenson/ruby-build.git"
# end

# node["rbenv"]["versions"].each do |version|
  # execute "install ruby #{version}" do
    # command "source #{RBENV_SCRIPT}; rbenv install #{version}"
    # not_if "source #{RBENV_SCRIPT}; rbenv versions | grep #{version}"
  # end
# end

# execute "set global ruby #{node["rbenv"]["global"]}" do
  # command "source #{RBENV_SCRIPT}; rbenv global #{node["rbenv"]["global"]}; rbenv rehash"
  # not_if "source #{RBENV_SCRIPT}; rbenv global | grep #{node["rbenv"]["global"]}"
# end

# node["rbenv"]["gems"].each do |gem|
  # execute "gem install #{gem}" do
    # command "source #{RBENV_SCRIPT}; gem install #{gem}; rbenv rehash"
    # not_if "source #{RBENV_SCRIPT}; gem list | grep #{gem}"
  # end
# end

# execute 'rbenv' do
  # command "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
  # # command "echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc"
  # # command "echo 'eval \"$(rbenv init -)\"' >> ~/.bashrc"
  # command "source ~/.bashrc"
  # command "git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
  # command "rbenv install 2.1.2"
  # command "rbenv rehash"
  # # command "rbenv global 2.1.1"
# end

# mysql
# package 'http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm' do
  # not_if 'rpm -q mysql-community-release-el6-5'
# end

# %w( mysql-community-server mysql-community-devel ).each do |pkg|
  # package pkg
# end

# utf8mb4_settting = <<"EOS"

# [mysqld]
# character-set-server = utf8mb4
# character-set-client-handshake  = FALSE
# character_set_server            = utf8mb4
# collation_server                = utf8mb4_unicode_ci
# innodb_file_format = Barracuda
# innodb_file_per_table = 1
# innodb_large_prefix

# [client]
# default-character-set=utf8mb4

# EOS

# execute "set db charset to utf8mb4" do
  # command <<-EOF
    # echo '#{utf8mb4_settting}' >> /etc/my.cnf
  # EOF
# end

# service 'mysqld' do
  # action [:start, :enable]
# end

