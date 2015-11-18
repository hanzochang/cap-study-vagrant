
# RBENV_DIR = "/usr/local/rbenv"
# RBENV_SCRIPT = "/etc/profile.d/rbenv.sh"

HOME_DIR = "/home/vagrant/"

package 'git' do
  action :install
end

package 'zsh' do
  action :install
end

execute 'set zsh as default shell' do
  command 'chsh -s /bin/zsh vagrant'
  not_if 'test "/bin/zsh" = "$(grep vagrant /etc/passwd | cut -d: -f7)"'
end

package 'vim' do
  action :install
end

package 'tmux' do
  action :install
end

git 'dotfiles' do
  repository "git://github.com/unosk/dotfiles.git"
  not_if "test -d dotfiles"
end

# execute "install dotfile" do
  # command "cd #{HOME_DIR} ; cd dotfiles/ ; sudo ./setup.sh"
# end

# bundler
