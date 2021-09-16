create table  prod_sa_contact_centers_raw.todrophtrunk(row_date string);
with prd as 
(
select count(*) cnt,row_Date from prod_sa_contact_centers_raw.htrunk group by row_Date
),
dev as (
select count(*) cnt,row_Date from dev_sa_contact_centers_raw.htrunk group by row_Date
)
insert overwrite table  prod_sa_contact_centers_raw.todrophtrunk 
select b.row_date row_date from 
prd a,dev b
where 
a.row_date=b.row_date
and 
a.cnt <> b.cnt
