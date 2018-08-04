SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [etl].[TM_LoadFacts]
(
	@BatchId UNIQUEIDENTIFIER = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

AS
BEGIN
	
	/* ********************************************* ODS PRE PROCESSING ********************************************* */
	EXEC [etl].[TM_ResetOverlappingSeatBlocks] @BatchId = @BatchId, @Options = @Options
	

	
	/* ********************************************* Fact Ticket Sales Processing ********************************************* */
	EXEC etl.TM_FactTicketSales_DeleteReturns @BatchId = @BatchId, @Options = @Options
		
	EXEC etl.TM_Stage_FactTicketSales @BatchId = @BatchId, @Options = @Options
	
	IF EXISTS (SELECT * FROM sys.procedures WHERE [object_id] = OBJECT_ID('etl.Cust_FactTicketSalesProcessing'))
	BEGIN	
		
		EXEC etl.Cust_FactTicketSalesProcessing @BatchId = @BatchId, @Options = @Options

	END
		
	EXEC [etl].[SSB_StandardModelLoad] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'etl.vw_FactTicketSales', @Source = 'etl.vw_Load_TM_FactTicketSales', @BusinessKey = 'ETL__SSID_TM_event_id, ETL__SSID_TM_section_id, ETL__SSID_TM_row_id, ETL__SSID_TM_seat_num', @SourceSystem = 'TM', @Options = @Options


	/* ********************************************* Fact Ticket Activity Processing ********************************************* */

	EXEC [etl].[TM_Stage_FactTicketActivity] @BatchId = @BatchId, @Options = @Options

	EXEC [etl].[SSB_StandardModelLoad] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'etl.vw_FactTicketActivity', @Source = 'etl.vw_Load_TM_FactTicketActivity', @BusinessKey = 'ETL__SSID_TM_ods_id', @SourceSystem = 'TM', @Options = @Options



	/* ********************************************* Fact Held Seats Processing ********************************************* */

	EXEC [etl].[TM_Stage_FactHeldSeats] @BatchId = @BatchId, @Options = @Options 

	DELETE t
	FROM etl.vw_FactHeldSeats t
	LEFT OUTER JOIN ods.TM_HeldSeats s ON t.ETL__SSID_TM_ods_id = s.id
	WHERE s.id IS NULL

	EXEC [etl].[SSB_StandardModelLoad] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'etl.vw_FactHeldSeats', @Source = 'etl.vw_Load_TM_FactHeldSeats', @BusinessKey = 'ETL__SSID_TM_ods_id', @SourceSystem = 'TM', @Options = @Options



	/* ********************************************* Fact Avail Seats Processing ********************************************* */

	EXEC [etl].[TM_Stage_FactAvailSeats] @BatchId = @BatchId, @Options = @Options

	DELETE t
	FROM etl.vw_FactAvailSeats t
	LEFT OUTER JOIN ods.TM_AvailSeats s ON t.ETL__SSID_TM_ods_id = s.id
	WHERE s.id IS NULL

	EXEC [etl].[SSB_StandardModelLoad] @BatchId = '00000000-0000-0000-0000-000000000000', @Target = 'etl.vw_FactAvailSeats', @Source = 'etl.vw_Load_TM_FactAvailSeats', @BusinessKey = 'ETL__SSID_TM_ods_id', @SourceSystem = 'TM', @Options = @Options



	/* ********************************************* Fact Inventory Processing ********************************************* */
	
	--EXEC etl.TM_LoadFactInventory_Seats @BatchId = @BatchId, @Options = @Options


	EXEC etl.TM_LoadFactInventory_Held @BatchId = @BatchId, @Options = @Options

	EXEC etl.TM_LoadFactInventory_Held_Plans @BatchId = @BatchId, @Options = @Options
	
	EXEC etl.TM_LoadFactInventory_Avail	@BatchId = @BatchId, @Options = @Options

	EXEC etl.TM_LoadFactInventory_Avail_Plans @BatchId = @BatchId, @Options = @Options

	EXEC etl.TM_LoadFactInventory_Sales @BatchId = @BatchId, @Options = @Options

	EXEC etl.TM_LoadFactInventory_Resold @BatchId = @BatchId, @Options = @Options

	EXEC etl.TM_LoadFactInventory_Tranferred @BatchId = @BatchId, @Options = @Options



	/* ********************************************* Fact Attendance Processing ********************************************* */

	EXEC etl.TM_LoadFactAttendance @BatchId = @BatchId, @Options = @Options

	

END
















GO
