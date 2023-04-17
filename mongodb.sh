cp mongo.repo /etc/yum.repos.d/mongo.repo

yum install mongodb-org -y

systemctl enable mongod
systemctl start mongod

# Edit  the  file to replace 127.0.0.1 to 0.0.0.0 in /etc/mongod.conf
sed -e 's|127.0.0.0.1|0.0.0.0|' /etc/mongod.conf


