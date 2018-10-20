# lcd_web
Practice Cookbook for linuxacademy local chef development badge

# Chef Workstation setup:
```
curl -s https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk

echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile

source ~/.bash_profile
```
# Install docker
```
sudo yum install -y git yum-utils

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum makecache fast

sudo yum -y install docker-ce

sudo systemctl enable docker

sudo systemctl start docker

sudo usermod -aG docker $USER

sudo systemctl stop getty@tty1.service

sudo systemctl mask getty@tty1.service

logout

docker network create --subnet=10.1.1.0/24 testnet

gem install kitchen-docker
```

# Generate with a Generator
```
mkdir generator
mkdir -p chef/cookbooks
chef generate generator generator/lcd_origin  
```
* Update kitchen.yml
```
---
driver:
 name: docker
 privileged: true
 use_sudo: false

provisioner:
 name: chef_zero
 # You may wish to disable always updating cookbooks in CI or     other testing environments.
 # For example:
 #   always_update_cookbooks: <%%= !ENV['CI'] %>
 always_update_cookbooks: true
 require_chef_omnibus: "13.8.5"

verifier:
 name: inspec

platforms:
 - name: centos-7.2
   driver_config:
     run_command: /usr/lib/systemd/systemd

suites:
 - name: default
   run_list:
     - recipe[<%= cookbook_name %>::default]
   verifier:
     inspec_tests:
       - test/smoke/default
   attributes:
```

* Genrating a cookbook using generator
`chef generate cookbook lcd_web -g ../../generator/lcd_origin`
