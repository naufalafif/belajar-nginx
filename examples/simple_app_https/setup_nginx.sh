sudo apt-get update -y
sudo apt-get install nginx -y
tar -xvf /home/vagrant/simple_app.tar
tar -xvf /home/vagrant/cert.tar
sudo mkdir /var/www/belajarnginx
sudo mv /home/vagrant/simple_app/* /var/www/belajarnginx
# sudo mv /home/vagrant/nginx.conf /etc/nginx/sites-available/belajarnginx
sudo rm /etc/nginx/nginx.conf
sudo cp /home/vagrant/nginx.conf /etc/nginx/nginx.conf
sudo systemctl restart nginx
