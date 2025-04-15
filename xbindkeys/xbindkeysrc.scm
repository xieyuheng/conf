;; ~/xbindkeysrc.scm

(xbindkey '(shift mod1 x) "emacsclient -c -e '(eshell t)'")
;; (xbindkey '(shift mod1 "c:36") "alacritty --working-directory $(xcwd)")
(xbindkey '(shift mod1 "c:36") "gnome-terminal --working-directory $(xcwd)")
(xbindkey '(control mod1 "c:36") "rofi -font 'unifont 36' -show run")
(xbindkey '(control F9) "i3lock")
(xbindkey '(control F10) "scrot")
