#!/bin/bash

#统计表名是否有重复的

echo "	begin st7"

source st1.sh

>701__count

#将一列一列的表名写到needImport中
for i in ${!arr[@]}
do
	num=`cat needImport.txt | grep "${arr[$i]}" | wc -l`
	printf "		%-50s %-5s\n"  ${arr[$i]}  $num >>701__count
done

#对统计后的结果进行排序
sort -rn -k2 701__count > 702__count

cat 702__count

rm -rf 701__count

echo "end st7"


