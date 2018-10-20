['net-tools', 'httpd'].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end
