#
# Cookbook Name:: desktopapps
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Note: Install vim after gnome-terminal to get gvim.
%w{
  xorg-server xorg-xinit
  slim archlinux-themes-slim slim-themes awesome
  xorg-xmodmap xorg-xset xscreensaver
  scim scim-uim scim-anthy uim-mozc 
  ttf-dejavu ttf-inconsolata ttf-migu
  ttf-ricty ttf-sazanami
  gnome-terminal vim chromium firefox
  rdesktop 
}.each do |p|
  package p 
end
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

# AUR
# TODO: Refactor this
bash "yaourt install dropbox-cli" do
  code "yaourt -S --noconfirm dropbox-cli"
  creates "/usr/bin/dropbox"
end
bash "yaourt install libreoffice" do
  code "yaourt -S --noconfirm libreoffice-calc libreoffice-impress libreoffice-ja"
  creates "/usr/bin/libreoffice"
end
# bash "yaourt install ttf" do
#   code "yaourt -S --noconfirm ttf-sazanami ttf-ricty"
#   creates "/usr/bin/libreoffice"
# end
