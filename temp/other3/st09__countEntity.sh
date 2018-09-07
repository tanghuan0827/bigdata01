#!/bin/bash

#生成在巨衫中查询的特定语句  sdb -f filename.txt 就可以了

>r9__numbercount.js

echo "db=new Sdb('197.3.84.202', 11810, 'sdbadmin', 'admin');">r9__numbercount.js


#将大写转换成小写
cat u7__tb.txt | while read myline1
do
    myline=`echo $myline1`

	if [ -z "$myline1" ];then
		continue
	fi
    echo 'println("'$myline'"+"  "+db.hdmp_pri5_rod.'$myline'.count());' >> r9__numbercount.js

done

echo end st9

