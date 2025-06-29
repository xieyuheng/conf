;; ~/.xbindkeysrc.scm

(xbindkey '(shift mod1 x) "emacsclient -c -e '(eshell t)'")
;; (xbindkey '(shift mod1 "c:36") "konsole --workdir $(xcwd)")
;; (xbindkey '(shift mod1 "c:36") "gnome-terminal --working-directory $(xcwd) --hide-menubar")
(xbindkey '(shift mod1 "c:36") "xfce4-terminal --working-directory $(xcwd) --hide-menubar")
;; (xbindkey '(control mod1 "c:36") "rofi -font 'unifont 36' -show run")
(xbindkey '(control mod1 "c:36") "dmenu_run -fn unifont-16 -l 20")
(xbindkey '(control F9) "i3lock")
(xbindkey '(control F10) "scrot")
