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
