HISTFILE=~/.histfile #Autocompletion history setup
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

zstyle :compinstall filename '/home/$USER/.zshrc' #Edit to change user directory
zstyle ':completion::complete:*' gain-privileges 1 #Allow autocompletion in privileged environmetns

autoload -Uz compinit
compinit

# Keybinds
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

# setup key accordingly 
[[ -n "${key[Home]}"          ]] && bindkey -- "${key[Home]}"          beginning-of-line
[[ -n "${key[End]}"           ]] && bindkey -- "${key[End]}"           end-of-line
[[ -n "${key[Insert]}"        ]] && bindkey -- "${key[Insert]}"        overwrite-mode
[[ -n "${key[Backspace]}"     ]] && bindkey -- "${key[Backspace]}"     backward-delete-char
[[ -n "${key[Delete]}"        ]] && bindkey -- "${key[Delete]}"        delete-char
[[ -n "${key[Up]}"            ]] && bindkey -- "${key[Up]}"            up-line-or-history
[[ -n "${key[Down]}"          ]] && bindkey -- "${key[Down]}"          down-line-or-history
[[ -n "${key[Left]}"          ]] && bindkey -- "${key[Left]}"          backward-char
[[ -n "${key[Right]}"         ]] && bindkey -- "${key[Right]}"         forward-char
[[ -n "${key[PageUp]}"        ]] && bindkey -- "${key[PageUp]}"        beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"      ]] && bindkey -- "${key[PageDown]}"      end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"     ]] && bindkey -- "${key[Shift-Tab]}"     reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word
            
# Finally, make sure the terminal is in application mode, when zle is  
# active. Only then are the values from $terminfo valid.            
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then            
	autoload -Uz add-zle-hook-widget            
	function zle_application_mode_start { echoti smkx }            
	function zle_application_mode_stop { echoti rmkx }            
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start   
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop  
fi            
            
# History Search            
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search 
zle -N up-line-or-beginning-search            
zle -N down-line-or-beginning-search            
            
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
            
autoload -Uz run-help # Add help command to zsh            
(( ${+aliases[run-help]} )) && unalias run-help            
alias help=run-help            
            
# Add color aliases for common commands            
if [ -x /usr/bin/dircolors ]; then            
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'            
	            
	alias grep='grep --color=auto'            
	alias fgrep='fgrep --color=auto'            
	alias egrep='egrep --color=auto'            
fi            

# Other common aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sudo='sudo '

# If on Arch, and you want to hook zsh into pacman to auto-rehash upon package changes, uncomment the following lines, and add the next block of lines to /etc/pacman.d/hooks/zsh.hook
#
#zshcache_time="$(date +%s%N)"
#autoload -Uz add-zsh-hook
#
#rehash_precmd() {
#	if [[ -a /var/cache/zsh/pacman ]]; then
#		local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
#		if (( zshcache_time < paccache_time )); then
#			rehash
#			zshcache_time="$paccache_time"
#		fi
#	fi
#}
#
#add-zsh-hook -Uz precmd rehash_precmd

# Create the file /etc/pacman.d/hooks/zsh.hook and add the following
#
#[Trigger]
#Operation = Install
#Operation = Upgrade
#Operation = Remove
#Type = Path
#Target = usr/bin/*
#[Action]
#Depends = zsh
#When = PostTransaction
#Exec = /usr/bin/install -Dm644 /dev/null /var/cache/zsh/pacman

# Add various directories to Path

export PATH=$PATH:/home/$USER/.local/bin:/etc/profile

# Initialize starship and zoxide
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# User aliases
alias vi=nvim
alias vim=nvim   
alias cd=z 
alias stl=systemctl

function mkcd() {
  mkdir $1 && cd $1
}

function cdls() {
  cd $1 && ls
}
