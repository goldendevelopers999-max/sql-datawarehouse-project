Create or ALTER   procedure [silver].[load_runsilver] as 
begin
	select * from silver.crm_cust_info;
	select * from silver.crm_prd_info;
	select * from silver.crm_sales_details;
	select * from silver.erp_cust_az12;
	select * from silver.erp_loc_a101;
	select * from silver.erp_px_cat_g1v2;
end
