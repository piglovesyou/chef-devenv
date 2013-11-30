#
# Cookbook Name:: system
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/etc/vconsole.conf" do
  mode 00644
end
cookbook_file "/usr/share/kbd/keymaps/i386/qwerty/jp106_unix_flavored.map.gz" do
  mode 00644
end
bash "timezone" do
  code "sudo ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime"
  code "sudo hwclock --systohc --utc"
  creates "/etc/localtime"
end
