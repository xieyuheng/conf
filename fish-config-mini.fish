alias l "ls -hCF"
alias ll "ls -hlF"
alias lll "ls -halF"
alias mv " mv -vi"
# alias rm " timeout 3 rm -Iv --one-file-system "
alias rm " rm -v "
alias df " df -h "
alias du " du -h "
alias st "git status"
alias add "git add .; and git status"
alias sub "git reset HEAD .; and git status"
alias ci "git commit; and git status"
alias up "git status; and git commit -m 'up'; and git push"
alias br "git branch -v"
alias bl "git branch -vva"
set PATH $PATH $HOME/.local/bin
set -x LC_CTYPE zh_CN.UTF-8
set -x EDITOR emacs --no-init-file --no-window-system
alias px "proxychains4 "
set fish_color_normal                   white
set fish_color_command                  white
set fish_color_quote                    white
set fish_color_redirection              white
set fish_color_end                      white
set fish_color_error                    white
set fish_color_param                    white
set fish_color_comment                  white
set fish_color_match                    white
set fish_color_search_match             white
set fish_color_operator                 white
set fish_color_escape                   white
set fish_color_cwd                      white
set fish_color_autosuggestion           white
set fish_color_user                     white
set fish_color_host                     white
set fish_pager_color_prefix             white
set fish_pager_color_completion         white
set fish_pager_color_description        white
set fish_pager_color_progress           white
set fish_pager_color_secondary          white
set fish_color_error red
function fish_greeting
end
set -x C_INCLUDE_PATH $HOME/usr/include
set -x LIBRARY_PATH $HOME/usr/lib
set -x C_INCLUDE_PATH /usr/local/include
set -x LIBRARY_PATH /usr/local/lib
set -x LD_LIBRARY_PATH /usr/local/lib
set PATH $HOME/.npm-packages/bin $PATH
set -x YARN_CACHE_FOLDER $HOME/.yarn-cache

function fish_user_key_bindings
  bind -e \ee
  bind -e \ev
end
