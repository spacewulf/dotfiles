#j/usr/bin/env bash

temp_directory=$(dirname "$0")
directory=${temp_directory::-1}
zsh_hook_file="zsh.hook"
zshrc_file=".zshrc"

config_files=(starship.toml wezterm)
home_files=(.alacritty.toml .tmux.conf)

mkdir -p /home/$USER/.config/zsh

for home_file in "${home_files[@]}"
do
  ln -sf $directory$home_file /home/$USER/
done

for config_file in "${config_files[@]}"
do
  ln -sf $directory$config_file /home/$USER/.config/
done

cp $directory$zshrc /home/$USER/.config/zsh/

