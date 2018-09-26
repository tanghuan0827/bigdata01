#!/bin/bash

echo "	begin st1"

source st0.sh

#去除yuan.txt中的空格
sed s/[[:space:]]//g yuan.txt >101__nospace

>102__xiaoxie

#将大写转换成小写
cat 101__nospace | while read myline1
do
	myline=`echo $myline1`
	echo "$myline" | tr 'A-Z' 'a-z'  >> 102__xiaoxie
done

#获取不重复的表名
function getNoRepeatTableName(){
	#获取不重复行的内容
	awk -F, '{print $1}'  102__xiaoxie  | uniq >103__uniqTb
	
	#删除空行
	sed '/^$/d' 103__uniqTb > 104__nolineTb
	
	source_tb=104__nolineTb
}

#获取排序的表名
function getOrderTableName(){
	getNoRepeatTableName
	
	sort 104__nolineTb > 105__sortTb
	
	source_tb=105__sortTb
}

#根据第一个参数判断是否排序，不排序有个bug，拆分的时候的最后一个表的字段有问题
if [ "$1" == "noOrder" ];then
	getNoRepeatTableName
elif [ "$1" == "order" ];then
	getOrderTableName
else
	echo "		you need to input order argument"
	exit
fi

#获取表名的数组，供其他脚本sh调用使用
tbName=`cat $source_tb | xargs`

arr=($tbName)

echo end st1





