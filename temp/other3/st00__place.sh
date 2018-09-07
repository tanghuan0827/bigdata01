#!/bin/bash
#文件的初始位置

echo "begin st0"

#当前文件夹的位置
work_path=$(dirname $0)
cd $work_path
pre_name=`pwd`

#判断当前文件夹是否存在temp文件，如果不存在，则创建，存在，则删除
pre_name_temp=${pre_name}/r4__temp


function addHuanHangFu(){
	filename=$1
	
	#对于数组换行符特别需要注意
	last_row_content=`awk 'NF{a=$0}END{print a}' $filename.txt`
	last_row_length=`echo ${last_row_content} | wc -L`

	if [ ${last_row_length} >0 ];then
		echo "">> $filename.txt
	fi
}

echo end st0

