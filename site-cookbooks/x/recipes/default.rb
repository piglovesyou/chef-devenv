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
