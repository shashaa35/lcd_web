def restart_httpd
  service platform_service_httpd do
	action :restart
	only_if {::File.exists?("/var/www/html/index.html")}
  end
end
