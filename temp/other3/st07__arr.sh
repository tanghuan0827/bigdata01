#!/bin/bash
#形成表名的文件

echo "begin st7__arr"

source ./st00__place.sh

#对于数组一定需要注意换行符 不太清楚底层 !!!
addHuanHangFu u7__tb

#去除yuan.txt中的空格
sed s/[[:space:]]//g u7__tb.txt >701__nospace

>702__xiaoxie

#将大写转换成小写
cat 701__nospace | while read myline1
do
	myline=`echo $myline1`
	echo "$myline" | tr 'A-Z' 'a-z'  >> 702__xiaoxie
done


#获取表名的数组，供其他脚本sh调用使用
tbName=`cat 702__xiaoxie | xargs`

arr=($tbName)

echo end st7__arr

