package 'zsh' do
  action :install
  user "root"
end

remote_file ".zshrc" do
  source "files/.zshrc"
end

execute 'set zsh as default shell' do
  command 'chsh -s /bin/zsh vagrant'
  not_if 'test "/bin/zsh" = "$(grep vagrant /etc/passwd | cut -d: -f7)"'
end
