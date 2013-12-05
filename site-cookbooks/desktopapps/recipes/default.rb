#
# Cookbook Name:: desktopapps
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# chromium
# %w{firefox gnome-terminal dropbox}.each do |p|
#   package p
# end

%w{
  xorg-server xorg-xinit
  slim archlinux-themes-slim slim-themes awesome
  xorg-xmodmap xorg-xset xscreensaver
  scim scim-uim scim-anthy
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
bash "yaourt install dropbox-cli" do
  code "yaourt -S --noconfirm dropbox-cli"
  creates "/usr/bin/dropbox"
end
