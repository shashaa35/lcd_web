#
# Cookbook:: lcd_web
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'lcd_web::users'

package 'net-tools' do
	action :install
end

package platform_package_httpd

service platform_service_httpd do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  cookbook 'lcd_web'
  source 'index.html.erb'
  owner 'apache'
  group 'apache'
  variables(
    greeting_scope: node['greeting_scope'],
    greeting: node['greeting'],
    fqdn: node['fqdn']
  )
end

restart_httpd
