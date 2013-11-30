#
# Cookbook Name:: users
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "pig" do
  home "/home/pig"
  shell "/bin/bash"
  password nil
  supports :manage_home => true
end
group "wheel" do
  action :modify
  members ['pig']
  append true
end
