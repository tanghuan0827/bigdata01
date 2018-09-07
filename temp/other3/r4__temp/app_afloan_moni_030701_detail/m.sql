create foreign table
	hdmp_pri5_rod_app_afloan_moni_030701_detail
(
data_dt text,
cust_no text,
cust_name text,
rel_type text,
creditlimitamount decimal(18,2)
)
server sdb_server
options(
	collectionspace 'hdmp_pri5_rod',
	collection 'app_afloan_moni_030701_detail',
	decimal 'on'
);
insert into
	hdmp_pri5_ecif_hdmp_table_info
values
(
	'rod',
	'app_afloan_moni_030701_detail',
	'hdmp_pri5_rod',
	'app_afloan_moni_030701_detail'
);
