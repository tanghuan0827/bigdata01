#!/bin/bash

#根据表名获取conf文件中需要导入的表名的配置信息 并放入到import.txt文件中
echo " begin st8"

#去除空格
sed s/[[:space:]]//g needImport.txt > 801__nospace

#转换为小写
>802__xiaoxie

cat 801__nospace | while read myline1
do 
	myline=`echo $myline1`
	echo "$myline" | tr 'A-Z' 'a-z'  >>802__xiaoxie
done

import=`cat 802__xiaoxie|xargs`

#将需要导入的表名放到一个数组
arrImport=($import)

>import.txt

#将conf文件的信息放入到import.txt中
for i in ${!arrImport[@]}
do 
	grep ${arrImport[$i]} result1.txt >> import.txt
	echo >> import.txt
done

echo end st8

