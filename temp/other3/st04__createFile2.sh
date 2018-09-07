#!/bin/bash
#形成建表语句

echo "begin st4"

source ./st07__arr.sh

> ${pre_name_temp}/total2.sql

#数组遍历从0开始  创建外表最后一行去掉逗号， conf文件还留有逗号
for i in ${!arr[@]}
do
	echo ${arr[$i]}
	
	
	tb_dir=${pre_name_temp}/${arr[$i]}
	cd $tb_dir/
	
	#将所有的sql都给m.sql  m.sql再给total.sql
	cat m.sql>>${pre_name_temp}/total2.sql
	
	cd ${pre_name}
done

#删除file文件
rm -rf f1__*
rm -rf f2__*

echo end st4

