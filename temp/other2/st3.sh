#!/bin/bash

#按照表名排序，字段还是没有排序
echo "	begin st3"

source st1.sh

>301__sort

#按照数组中表名的排序顺序，形成源文件， 可能排序，也可能不排序
for i in ${!arr[@]}
do
	grep ${arr[$i]} 102__xiaoxie  >> 301__sort
	echo ",,">>301__sort
done

if [ "$1" == "noOrder" ];then
	source__txt=102__xiaoxie
elif [ "$1" == "order" ];then
	source__txt=301__sort
else
	echo "		you need to input order argument"
	exit
fi

echo end st3

