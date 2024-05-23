
update-sway:
	rm -f ~/.mekadimo_date.py
	rm -f ~/.mekadimo_date.awk
	cp tiling-wm-config/.mekadimo_date.py ~/.mekadimo_date.py
	cp tiling-wm-config/.mekadimo_date.awk ~/.mekadimo_date.awk
	rm -f ~/.gtkrc-2.0
	cp tiling-wm-config/.gtkrc-2.0 ~/.gtkrc-2.0
	mkdir -p ~/.config/gtk-3.0
	rm -f ~/.config/gtk-3.0/settings.ini
	cp tiling-wm-config/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
	mkdir -p ~/.config/sway
	rm -f ~/.config/sway/config
	cp tiling-wm-config/.config/sway/config ~/.config/sway/config
	mkdir -p ~/.config/waybar
	rm -f ~/.config/waybar/config
	cp tiling-wm-config/.config/waybar/config ~/.config/waybar/config
	rm -f ~/.config/waybar/style.css
	cp tiling-wm-config/.config/waybar/style.css ~/.config/waybar/style.css
	mkdir -p ~/.config/foot
	rm -f ~/.config/foot/foot.ini
	cp tiling-wm-config/.config/foot/foot.ini ~/.config/foot/foot.ini
	rm -f ~/.config/lvim/config.lua
	mkdir -p ~/.config/lvim
	cp tiling-wm-config/.config/lvim/config.lua ~/.config/lvim/config.lua