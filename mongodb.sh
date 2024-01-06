script_location=$(pwd)

cp ${script_location}/files/mongodb.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-org -y

systemctl enable mongod
systemctl start mongod

#need to change port addres SED editor helps us in search----delete----substitue

