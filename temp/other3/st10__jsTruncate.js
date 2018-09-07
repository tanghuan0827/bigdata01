
#!/bin/bash
#执行巨衫的建表语句

echo " begin st10"

source ./st07__arr.sh

#数组的遍历从0开始
for i in ${!arr[@]}
do
    cd ${pre_name_temp}/${arr[$i]}/
    sdb -f sequoiadb_truncate.js &
    sleep 3
done

echo end st10

