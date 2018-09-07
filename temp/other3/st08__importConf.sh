#!/bin/bash

#根据表名获取conf文件中需要导入的表名的配置信息 并放入到import.txt文件中
echo "begin st8"

#=======================================================

if [ "$1" == "" ];then
	source ./st07__arr.sh
	
	>r8__import.txt

	for i in ${!arr[@]}
	do
		grep ${arr[$i]} r5__result1.txt >> r8__import.txt
		echo >> r8__import.txt
	done

	echo end st8

	exit
fi

#=======================================================
#去除空格
#去除yuan.txt中的空格
sed s/[[:space:]]//g u7__tb2.txt >801__nospace

>802__xiaoxie

#将大写转换成小写
cat 801__nospace | while read myline1
do
    myline=`echo $myline1`
    echo "$myline" | tr 'A-Z' 'a-z'  >> 802__xiaoxie
done
#=========================

#拆分成两份 一份是月份 一份是日的
awk 'BEGIN{RS="\n\n"}{a++}{print > "md__"a}' 802__xiaoxie

monthImport=`cat md__1 | xargs`
dayImport=`cat md__2 | xargs`

#将需要的表名放到一个数组
monthArr=($monthImport)
dayArr=($dayImport)

>r8__monthImport.txt
>r8__dayImport.txt

fileImport=r5__result1.txt

for i in ${monthArr[@]}
do
	line=`grep ${monthArr[$i]} $fileImport`
	if [ -z "$line" ];then
		echo ${monthArr[$i]}" not find		month"
		continue
	fi
	echo $line >> r8__monthImport.txt
	echo >> r8__monthImport.txt
done

for i in ${dayArr[@]}
do
    line=`grep ${dayArr[$i]} $fileImport`
    if [ -z "$line" ];then
        echo ${dayArr[$i]}" not find        day"
        continue
    fi
    echo $line >> r8__dayImport.txt
    echo >> r8__dayImport.txt
done

echo end st8
	


