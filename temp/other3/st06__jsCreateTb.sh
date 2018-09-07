#!/bin/bash
#执行巨衫的建表语句

echo " begin st6"

if [ "$1"== "" ];then
	source st04__createFile.sh
else
	source st07__arr.sh
fi

#数组的遍历从0开始
for i in ${!arr[@]}
do
	echo 
	echo $(($i+1))
	
	cd ${pre_name_temp}/${arr[$i]}/
	#sdb -f sequoiadb_drop.js &
	#sleep 3
	sdb -f sequoiadb_create.js &
	#sleep 10
done

echo end st6
