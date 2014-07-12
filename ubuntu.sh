sudo passwd root
apt-get install openssh-server

# enable login as root 
#otherwise, su after login
/etc/ssh/sshd_config
sudo /etc/init.d/ssh restart

sudo apt-get -y install curl
\curl -L https://get.rvm.io | bash -s stable
sudo adduser  kwei rvm
Adding user `kwei' to group `rvm' ...
Adding user kwei to group rvm
sudo deluser  kwei rvm
Removing user `kwei' from group `rvm' ...

exit and login
apt-get -y install  vim
apt-get -y install git

rvm install ruby -v 2.1.1
gem install --no-rdoc --no-ri rails -v 4.0.3
gem install heroku

# Database
apt-get -y install -y postgresql postgresql-contrib libpq-dev

apt-get install mysql-server
apt-get install libmysqlclient-dev

# 14.04 LTS not 12.04
apt-get install libmagick++-dev
gem install rmagick


postgres
sudo su postgres -c  "createuser root --pwprompt"  
sudo -u postgres dropdb   $dbname
sudo -u postgres createdb $dbname

#postgresql 
 /etc/init.d/postgresql status
 psql -l
 psql TCM_production
SELECT version();
\
\dt
\q

#mysql
  mysql -uroot -p$DBPWD -e "drop database $DBNAME"
  sql="create database $DBNAME CHARACTER SET utf8 COLLATE utf8_general_ci"
  mysql -uroot -p$DBPWD -e "$sql"
