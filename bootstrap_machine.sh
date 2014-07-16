brew install zsh
sudo ln -s /usr/local/Cellar/zsh/5.0.5/bin/zsh /usr/bin/zsh
echo "/usr/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/bin/zsh


ln -s "$PWD/pure/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup

brew install vim ack

ln -sF /usr/local/Cellar/vim/7.4.052/bin/vim /usr/local/bin/vim
ln -s dotfiles/vimrc .vimrc

cd ~/.vim/bundle/vimproc && make

