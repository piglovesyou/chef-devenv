#
# Cookbook Name:: desktopapps
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/home/" + ENV['SUDO_USER'] + "/.xinitrc" do
  mode 700
end

# Sometime I need 'pacman -Syyu' before installing those.
%w{
  xorg-server xorg-xinit
  slim archlinux-themes-slim awesome
  xorg-xmodmap xorg-xset xscreensaver xterm xclip
  rxvt-unicode uim scim scim-uim scim-anthy
  ttf-dejavu ttf-inconsolata ttf-sazanami
  gvim chromium thunar
}.each do |p|
  package p 
end
file "/usr/bin/gview" do
  action :delete
end
# I don't know why I cannot 'package "firefox"' ?

cookbook_file "/etc/slim.conf" do
  mode 00644
end

bash "slim.service" do
  code "sudo systemctl enable slim.service; sudo systemctl start slim.service"
  creates "/etc/systemd/system/display-manager.service"
end

link "/usr/local/bin/vi" do
  to "/usr/bin/vim"
end


bash "Install AUR" do
  def yaourt package
    "pacman -Qi #{package} >/dev/null 2>&1 || yaourt -S --noconfirm #{package}"
  end
  code yaourt "ttf-migu"
  code yaourt "ttf-ricty"
end


# Not now:
# dropbox-cli libreoffice
