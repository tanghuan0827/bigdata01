#!/bin/bash
#形成conf文件

echo "	begin st5"

source ./st03__sourceTxt.sh

echo "		$source__txt"

#去掉,,双逗号
sed s/,,//g $source__txt > 501__source

#字段类型替换  判断第3列是进行整个值得判断，不是单独一个值
awk 'BEGIN{FS=OFS=","}{if($3=="varchar"){$3="string"};print}'  501__source>502__string
awk 'BEGIN{FS=OFS=","}{if($3=="integer"){$3="int"};print}' 502__string>503__int
awk 'BEGIN{FS=OFS=","}{if($3=="long"){$3="long"};print}' 503__int>504__long


awk -F, '{print $2" "$3","$4","}' 504__long > 505__field
sed -i "s/,,/,/"  505__field

>506__field

#将每行中只包含,去掉
cat 505__field | while read myline1
do
	myline=`echo $myline1`
	if [ "$myline" == "," ];then
		echo "">>506__field
	else 
		echo "$myline" >> 506__field
	fi
done


#文件的拆分 文件序号从1开始
awk 'BEGIN{RS="\n\n"}{a++}{print > "f51__"a}'  506__field

f51_count=`ls -l |grep f51 |wc -l`

echo "		$f51_count"

>r5__result1.txt
>r5__result2.txt

for i in `seq 1 $f51_count`
do 
	#将所有字段写成一行，并对表名和其他字符串进行拼接
	content=`cat "f51__"$i|xargs`
	content_1=$content" sequoiadb_load_date string default \$(date +%Y%m%d)"
	echo ""${arr[$(($i-1))]}"_FIELD_S="$content_1>>r5__result1.txt
	echo "#"${arr[$(($i-1))]}"_FIELD_S="$content_1>>r5__result2.txt
	
	echo >> r5__result1.txt
	echo >> r5__result2.txt
done

#删除field文件
rm -rf f51*

echo end st5
