update-common:
	rm -f $$HOME/.mekadimo_date.py
	rm -f $$HOME/.mekadimo_date.awk
	cp shared/.mekadimo_date.py $$HOME/.mekadimo_date.py
	cp shared/.mekadimo_date.awk $$HOME/.mekadimo_date.awk
	rm -f $$HOME/.gtkrc-2.0
	cp shared/gtk/.gtkrc-2.0 $$HOME/.gtkrc-2.0
	mkdir -p $$HOME/.config/gtk-3.0
	rm -f $$HOME/.config/gtk-3.0/settings.ini
	cp shared/gtk/gtk-3.0/settings.ini $$HOME/.config/gtk-3.0/settings.ini
	mkdir -p $$HOME/.config/gtk-4.0
	rm -f $$HOME/.config/gtk-4.0/settings.ini
	cp shared/gtk/gtk-4.0/settings.ini $$HOME/.config/gtk-4.0/settings.ini
	rm -f $$HOME/.config/lvim/config.lua
	mkdir -p $$HOME/.config/lvim
	cp shared/lvim/config.lua $$HOME/.config/lvim/config.lua
	mkdir -p "$$HOME/.config/Code - OSS/"
	mkdir -p "$$HOME/.config/Code - OSS/User/"
	rm -f "$$HOME/.config/Code - OSS/User/settings.json"
	cp shared/code/settings.json "$$HOME/.config/Code - OSS/User/settings.json"

update-sway: | update-common
	mkdir -p $$HOME/.config/sway
	rm -f $$HOME/.config/sway/config
	cp sway/config $$HOME/.config/sway/config
	mkdir -p $$HOME/.config/waybar
	rm -f $$HOME/.config/waybar/config
	cp sway/waybar/config $$HOME/.config/waybar/config
	rm -f $$HOME/.config/waybar/style.css
	cp sway/waybar/style.css $$HOME/.config/waybar/style.css
	mkdir -p $$HOME/.config/foot
	rm -f $$HOME/.config/foot/foot.ini
	cp sway/foot/foot.ini $$HOME/.config/foot/foot.ini

update-i3: | update-common
	rm -f $$HOME/.Xresources
	cp i3/.Xresources $$HOME/.Xresources
	mkdir -p $$HOME/.config/i3
	rm -f $$HOME/.config/i3/config
	cp i3/config $$HOME/.config/i3/config
	mkdir -p $$HOME/.config/polybar
	rm -f $$HOME/.config/polybar/config.ini
	cp i3/polybar/config.ini $$HOME/.config/polybar/config.ini
	rm -f $$HOME/.config/polybar/launch.sh
	cp i3/polybar/launch.sh $$HOME/.config/polybar/launch.sh
	chmod +x ~/.config/polybar/launch.sh
