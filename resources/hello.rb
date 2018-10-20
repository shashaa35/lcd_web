resource_name :hello_httpd
property :greeting, :kind_of => String

default_action :create
action :create do
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
      greeting: new_resource.greeting,
      fqdn: node['fqdn']
    )
  end

  restart_httpd
end

action_class do
  include LcdWebCookbook::Helpers
end
