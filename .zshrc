# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install

# NOTE pacman -S zsh-completions
# The following lines were added by compinstall
zstyle :compinstall filename '/home/xyh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# NOTE pacman -S zsh-syntax-highlighting zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias l="ls -hCF"
alias ll="ls -hlF"
alias lll="ls -halF"
alias mv=" mv -vi"
# alias rm=" timeout 3 rm -Iv --one-file-system "
alias rm=" rm -v "
alias df=" df -h "
alias du=" du -h "

alias st="git status"
alias add="git add . && git status"
alias sub="git reset HEAD . && git status"
alias ci="git commit && git status"
alias up="git status && git commit -m 'up' && git push"
alias br="git branch -v"
alias bl="git branch -vva"
