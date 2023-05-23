#!/bin/bash
mkdir -p /showdoc_data/html
chmod  -R 777 /showdoc_data
echo -n "输入服务器所在位置，1为国内，2为国际> "
read character
if [ "$character" = "1" ]; then
    docker pull registry.cn-shenzhen.aliyuncs.com/star7th/showdoc
    docker tag registry.cn-shenzhen.aliyuncs.com/star7th/showdoc:latest star7th/showdoc:latest 
elif [ "$character" = "2" ]; then
    docker pull star7th/showdoc:latest
else
    echo 输入不符合要求
fi
docker run -d --name showdoc --user=root --privileged=true -p 8001:80 -v /showdoc_data/html:/var/www/html/ star7th/showdoc
echo  "http://localhost:4999 来访问showdoc。账户密码是showdoc/123456"
