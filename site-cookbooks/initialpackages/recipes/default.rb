#
# Cookbook Name:: nodejs
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{vim tmux nodejs python2 git subversion}.each do |p|
  package p do
    action :install
  end
end
