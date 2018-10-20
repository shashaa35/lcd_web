#
# Cookbook:: lcd_web
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'lcd_web::users'

package 'net-tools' do
	action :install
end

hello_httpd 'custom resource' do
  greeting "Hello Shashank"
end
