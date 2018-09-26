#!/bin/bash

echo "	begin st0"

#当前文件夹的位置
work_path=$(dirname $0)
cd $work_path
pre_name=`pwd`

#判断当前文件夹是否存在temp文件，如果不存在，则创建，存在，则删除
pre_name_temp=${pre_name}/temp

if [ -d $pre_name_temp ];then
	#rm -rf $pre_name_temp
	echo "		temp exist"
else
	mkdir $pre_name_temp
fi

echo end st0
