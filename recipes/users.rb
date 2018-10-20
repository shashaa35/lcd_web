#
# Cookbook:: lcd_web
# Recipe:: users
#
# Copyright:: 2018, The Authors, All Rights Reserved.

group 'developers'

user 'webadmin' do
	action :create
	uid '1020'
	gid 'developers'
	home '/home/wbadmin'
	shell '/bin/bash'
end
