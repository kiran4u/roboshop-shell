
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip

cd /app
npm install
cp catalogue.service /etc/systemd/system/user.service
systemctl daemon-reload
systemctl enable user
systemctl start user

# To load schema we need to install mongodb client.
cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb-dev.kiranbachudevops.online </app/schema/user.js

