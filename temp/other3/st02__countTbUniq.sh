#!/bin/bash

#统计表名是否有重复的
echo "	begin st2"

source ./st01__tbName.sh

>201__count


for i in ${!arr[@]}
do
	num=`cat 104__nolineTb | grep "${arr[$i]}" | wc -l`
	printf "%-50s  %-5s\n"  ${arr[$i]}  $num >> 201__count
done

#对表名进行排序，最多的在最前面
sort -rn -k2 201__count >202__count
cat 202__count

rm -rf 201__count

echo end st2

