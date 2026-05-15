create or alter procedure bronze.load_bronze as 
begin
	declare @starttime datetime , @endtime datetime, @batchstarttime datetime, @batchendtime datetime;
	begin try 
		
			print '----------------------------------';
			print 'Loading Bronze Layer';
			print '----------------------------------';


			print '----------------------------------';
			print 'Loading CRM Tables';
			print '----------------------------------';

			set @batchstarttime = GETDATE();
			print '>> Truncating the Table: bronze.crm_cust_info';
			truncate table bronze.crm_cust_info;
			print '>> Inserting the data in to Table: bronze.crm_cust_info';

			set @starttime = GETDATE();
			bulk insert bronze.crm_cust_info
			from 'C:\Users\shafaz01\OneDrive - CSG Systems Inc\Desktop\Learning\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
			with (
					firstrow = 2,
					fieldterminator = ',',
					tablock
			);
			set @endtime = GETDATE();
			print 'Load Duration: ' + cast(datediff(second, @starttime,@endtime) as nvarchar) + ' seconds';
			print '=======================================================================================';

			print '>> Truncating the Table: bronze.crm_prd_info';
			truncate table bronze.crm_prd_info;
			print '>> Inserting the data in to Table: bronze.crm_prd_info';


			set @starttime = GETDATE();
			bulk insert bronze.crm_prd_info
			from 'C:\Users\shafaz01\OneDrive - CSG Systems Inc\Desktop\Learning\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
			with (
					firstrow = 2,
					fieldterminator = ',',
					tablock
			);
			set @endtime = GETDATE();
			print 'Load Duration: ' + cast(datediff(second, @starttime,@endtime) as nvarchar) + ' seconds';
			print '=======================================================================================';

			print '>> Truncating the Table: bronze.crm_sales_details';
			truncate table bronze.crm_sales_details;
			print '>> Inserting the data in to Table: bronze.crm_sales_details';

			set @starttime = GETDATE();
			bulk insert bronze.crm_sales_details
			from 'C:\Users\shafaz01\OneDrive - CSG Systems Inc\Desktop\Learning\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
			with (
					firstrow = 2,
					fieldterminator = ',',
					tablock
			);
			set @endtime = GETDATE();
			print 'Load Duration: ' + cast(datediff(second, @starttime,@endtime) as nvarchar) + ' seconds';
			print '=======================================================================================';

			print '----------------------------------';
			print 'Loading ERP Tables';
			print '----------------------------------';


			print '>> Truncating the Table: bronze.erp_cust_az12';
			truncate table bronze.erp_cust_az12;
			print '>> Inserting the Data in to Table: bronze.erp_cust_az12';

			set @starttime = GETDATE();
			bulk insert bronze.erp_cust_az12
			from 'C:\Users\shafaz01\OneDrive - CSG Systems Inc\Desktop\Learning\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
			with (
					firstrow = 2,
					fieldterminator = ',',
					tablock
			);
			set @endtime = GETDATE();
			print 'Load Duration: ' + cast(datediff(second, @starttime,@endtime) as nvarchar) + ' seconds';
			print '=======================================================================================';


			print '>> Truncating the Table: bronze.erp_loc_a101';
			truncate table bronze.erp_loc_a101;
			print '>> Inserting the data in to Table: bronze.erp_loc_a101';

			set @starttime = GETDATE();
			bulk insert bronze.erp_loc_a101
			from 'C:\Users\shafaz01\OneDrive - CSG Systems Inc\Desktop\Learning\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
			with (
					firstrow = 2,
					fieldterminator = ',',
					tablock
			);
			set @endtime = GETDATE();
			print 'Load Duration: ' + cast(datediff(second, @starttime,@endtime) as nvarchar) + ' seconds';
			print '=======================================================================================';


			print '>> Truncating the Table: bronze.erp_px_cat_g1v2';
			truncate table bronze.erp_px_cat_g1v2;
			print '>> Inserting the data in to Table: bronze.erp_px_cat_g1v2';

			set @starttime = GETDATE();
			bulk insert bronze.erp_px_cat_g1v2
			from 'C:\Users\shafaz01\OneDrive - CSG Systems Inc\Desktop\Learning\SQL\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
			with (
					firstrow = 2,
					fieldterminator = ',',
					tablock
			);
			set @endtime = GETDATE();
			set @batchendtime = GETDATE();
			print 'Load Duration: ' + cast(datediff(second, @starttime,@endtime) as nvarchar) + ' seconds';
			print '=======================================================================================';

			print '=======================================================================================';
			print 'Total Load Duration of Bronze Layer: ' + cast(datediff(millisecond, @batchstarttime, @batchendtime) as nvarchar) + ' seconds' 
			print '=======================================================================================';

	end try
	begin catch
			print '=======================================================================================';
			print 'Error Occured during loading bronze layer';
			print 'Error Message: ' + Error_Message();
			print 'Error Message: ' + cast(Error_Number() as Nvarchar);
			print 'Error Message: ' + cast(Error_State() as nvarchar);
			print '=======================================================================================';
	end catch
end
