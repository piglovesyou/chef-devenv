#
# Cookbook Name:: x
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{xorg-server xorg-xinit slim archlinux-themes-slim slim-themes awesome}.each do |p|
  package p do
    action :install
  end
end
cookbook_file "/etc/slim.conf" do
  mode 00644
end
bash "slim.service" do
  code "sudo systemctl enable slim.service; sudo systemctl start slim.service"
  creates "/etc/systemd/system/display-manager.service"
end
