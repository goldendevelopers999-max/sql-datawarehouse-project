#validation queries: crm_cust info - Table 1

select cst_id,
count(*)
from silver.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null


select cst_firstname
from silver.crm_cust_info
where cst_firstname != trim(cst_firstname)

select cst_lastname
from silver.crm_cust_info
where cst_lastname != trim(cst_lastname)

select cst_gndr
from bronze.crm_cust_info
where cst_gndr != trim(cst_gndr)

select cst_gndr, count(*) from silver.crm_cust_info group by cst_gndr having count(*) >1

#validation queries: crm_prd_info  - Table 2

select * from bronze.crm_prd_info


select
case when upper(trim(prd_line)) = 'M' then 'Mountain'
	when upper(trim(prd_line)) = 'R' then 'Road'
	when upper(trim(prd_line)) = 'S' then 'Other Sales'
	when upper(trim(prd_line)) = 'T' then 'Touring'
	else 'n/a'
end prd_line
from
bronze.crm_prd_info

select
replace(SUBSTRING(prd_key, 1, 5), '-','_') as cat_id
from bronze.crm_prd_info

select
SUBSTRING(prd_key, 7, len(prd_key) )as prd_key
from bronze.crm_prd_info

select prd_nm
from bronze.crm_prd_info
where prd_nm = trim(prd_nm)

select prd_cost
from bronze.crm_prd_info
where prd_cost < 0 or prd_cost is null


select
count(*)
from(
select
coalesce(prd_cost,0) as prd_cost
from bronze.crm_prd_info)t

select count(prd_line)
from 
bronze.crm_prd_info
where trim(prd_line) = prd_line

select *
from bronze.crm_prd_info
where prd_start_dt is null

#validation: silver.crm_sales_details - Table 3

insert into bronze.crm_sales_details values('so9854789','abc-123456',157845,20501125,20251487,20257841,87,0,258)

update bronze.crm_sales_details set sls_price = -87 where sls_quantity = 0

delete from bronze.crm_sales_details where sls_quantity = 0

select * from bronze.crm_sales_details where sls_sales is null or sls_sales <= 0 or sls_sales != sls_price * sls_quantity

select * from bronze.crm_sales_details where sls_quantity is null or sls_quantity <= 0

select * from bronze.crm_sales_details where sls_price is null or sls_price <= 0 or sls_price != sls_sales / nullif(sls_quantity,0)

select sls_order_dt, sls_due_dt, sls_ship_dt
from bronze.crm_sales_details
where sls_order_dt > sls_due_dt or sls_order_dt > sls_ship_dt


select sls_order_dt from bronze.crm_sales_details where sls_order_dt <= 0 or sls_order_dt is null

validation: silver.erp_cust_az12 - Table 4

select bdate from bronze.erp_cust_az12 where bdate < '1926-01-01' or bdate> getdate()


select * from silver.erp_cust_az12 where bdate > getdate()

validation: silver.erp_loc_a101 - Table 5

select distinct cntry,
case when cntry = 'DE' then 'Germany'
	 when cntry in ('USA', 'US') then 'United States'
	 when cntry is null or cntry = '' then 'n/a'
	 else cntry
end cntry
from bronze.erp_loc_a101


validation: silver.erp_px_cat_g1v2 Table 6

select * from bronze.erp_px_cat_g1v2
where trim(cat) != cat or subcat != trim(subcat) or trim(maintenance) != maintenance

