script_location=$(pwd)

cp ${script_location}/files/mongodb.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-org -y

systemctl enable mongod
systemctl start mongod

#need to change port addres SED editor helps us in search----delete----substitue

 sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
systemctl enable mongod
systemctl start mongod
