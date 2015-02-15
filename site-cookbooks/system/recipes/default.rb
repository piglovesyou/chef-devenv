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
bash "edit locale.gen" do
  only_if { File.readlines("/etc/locale.gen").grep(/#en_US.UTF-8 UTF-8/).any? }
  code "sudo sed -E -i -e 's/#((en_US|ja_JP).UTF-8 UTF-8)/\\1/' /etc/locale.gen && sudo locale-gen"
  # code "sudo sed -E -i -e 's/#(ja_JP.UTF-8 UTF-8)/\\1/' /etc/locale.gen"
end
%w{
  abs
  wget zip unzip
  tmux nodejs python2 git tig
}.each do |p|
  package p
end
