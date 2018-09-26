#!/bin/bash

echo "	begin st4"

source st3.sh

#字段类型替换  判断第3列是进行整个值得判断，单独一个值全部判断并进行替换，不是部分替换
awk 'BEGIN{FS=OFS=","}{if($3=="varchar"){$3="text"};print}'  $source__txt>401__text
awk 'BEGIN{FS=OFS=","}{if($3=="int"){$3="integer"};print}' 401__text>402__integer
awk 'BEGIN{FS=OFS=","}{if($3=="long"){$3="bigint"};print}' 402__integer>403__bigint

#获取字段名 decimal分隔符有问题，并且也带有引号
sed s/\"//g  403__bigint > 404__noyinhao
awk -F, '{print $2" "$3","$4","}' 404__noyinhao>405__field
sed -i "s/,,/,/" 405__field

>406__field

#将每行中只包含多余的,去掉
cat 405__field | while read myline1
do
	myline=`echo $myline1`
	if [ "$myline" == "," ]; then
		echo "">>406__field
	else
		echo "$myline" >> 406__field
	fi
done

#注意 拆分文档有时最后一个文档会多出一行，不知道原因，检查最后一个表
awk 'BEGIN{RS="\n\n"}{a++}{print >"f1__"a}'  406__field

#获取有多少个
f1_count=`ls -l | grep f1 | wc -l`

echo $f1_count

> ${pre_name_temp}/total.sql

#数组遍历从0开始  创建外表最后一行去掉逗号， conf文件还留有逗号
for i in ${!arr[@]}
do
	echo ${arr[$i]}
	m=$(($i+1))
	
	#获取最后一行内容和长度
	last_row_content=`awk 'NF{a=$0}END{print a}' "f1__"$m`
	last_row_length=`echo ${last_row_content} | wc -L`
	sed -i '$d' "f1__"$m 
	
	#注意最后一个表
	#if [ $f1_count = $m ];then
	# 	echo "======================"
	#	sed -i '$d' "f1__"$m
	#fi
	
	echo ${last_row_content:0:$(($last_row_length-1))}>> "f1__"$m
	
	cat pg__head.txt> "f2__"$m 
	cat "f1__"$m>>"f2__"$m
	cat pg__end.txt>>"f2__"$m 
	
	tb_dir=${pre_name_temp}/${arr[$i]}
	#这里复制文件到temp下，将表空间的名字替换成表名
	mkdir -p $tb_dir
	cp -r ${pre_name}/create_js_sql/* $tb_dir/
	cd $tb_dir/
	cp ${pre_name}/"f2__"$(($i+1))  $tb_dir/pg.sql
	sed -i "s/sequoiadb_cl/${arr[$i]}/g"  $tb_dir/*
	
	#将所有的sql都给m.sql  m.sql再给total.sql
#	cat del.sql>m.sql
	cat pg.sql>>m.sql
	cat grant.sql>>m.sql
	cat m.sql>>${pre_name_temp}/total.sql
	
	cd ${pre_name}
done

#删除file文件
#rm -rf f1__*
#rm -rf f2__*

echo end st4


