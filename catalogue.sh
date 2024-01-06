script_location=$(pwd)


dnf module disable nodejs -y
dnf module enable nodejs:18 -y
dnf install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
rm -rf /app/*
cd /app
unzip /tmp/catalogue.zip
cd /app
npm install

cp ${script_location}/files/catalogue.servicefile /etc/systemd/system/catalogue.service
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue

cp ${script_location}/files/mongodb.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-org-shell -y

mongo --54.91.214.121</app/schema/catalogue.js