create foreign table
	hdmp_pri5_rod_app_afloan_moni_030701_stat
(
data_dt text,
cust_no text,
is_add text
)
server sdb_server
options(
	collectionspace 'hdmp_pri5_rod',
	collection 'app_afloan_moni_030701_stat',
	decimal 'on'
);
