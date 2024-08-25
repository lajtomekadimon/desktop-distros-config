
update-sway:
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
	rm -f $$HOME/.config/lvim/config.lua
	mkdir -p $$HOME/.config/lvim
	cp shared/lvim/config.lua $$HOME/.config/lvim/config.lua
	mkdir -p "$$HOME/.config/Code - OSS/"
	mkdir -p "$$HOME/.config/Code - OSS/User/"
	rm -f "$$HOME/.config/Code - OSS/User/settings.json"
	cp shared/code/settings.json "$$HOME/.config/Code - OSS/User/settings.json"
