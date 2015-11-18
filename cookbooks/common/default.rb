%w(vim tmux libmysqlclient-dev).each do |pkg|
  package pkg do
    action :install
    user "root"
  end
end
