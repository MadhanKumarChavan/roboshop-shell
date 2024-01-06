script_location=$(pwd)

echo -e "\e[35m Install nginx\e[0m"
dnf install nginx -y

echo -e "\e[36m Remove old content from nginx\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[35m download frontend content in temp directory\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[37m switch directory\e[0m"
cd /usr/share/nginx/html

echo -e "\e[35m unzip front end content\e[0m"
unzip /tmp/frontend.zip

echo -e "\e[37m copy files in pesent location\e[0m"
cp ${script_location}/files/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf

systemctl enable nginx

systemctl restart nginx
