service "nginx"

package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
end

# vagrant
# execute 'set zsh as default shell' do
  # command 'chsh -s /bin/zsh vagrant'
  # not_if 'test "/bin/zsh" = "$(grep vagrant /etc/passwd | cut -d: -f7)"'
# end


