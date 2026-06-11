Create or ALTER   procedure [bronze].[load_runbronze] as

begin

	select * from bronze.crm_cust_info
	
	select * from bronze.crm_prd_info
	
	select * from bronze.crm_sales_details
	
	select * from bronze.erp_cust_az12
	
	select * from bronze.erp_loc_a101
	
	select * from bronze.erp_px_cat_g1v2
end
