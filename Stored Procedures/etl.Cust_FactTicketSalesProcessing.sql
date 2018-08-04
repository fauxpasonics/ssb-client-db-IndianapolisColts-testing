SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--DROP TABLE #fts

--SELECT * 
--INTO #fts 
--FROM dbo.FactTicketSales_V2

--SELECT * FROM #fts

--UPDATE dbo.FactTicketSales_V2
--SET DimTicketClassId = -1 
--UPDATE dbo.FactTicketSales_V2
--SET DimTicketTypeId = -1 
--UPDATE dbo.FactTicketSales_V2 
--SET DimPlanTypeId = -1 

CREATE PROCEDURE [etl].[Cust_FactTicketSalesProcessing]
(
	@BatchId NVARCHAR(50) = '00000000-0000-0000-0000-000000000000',
	@Options NVARCHAR(MAX) = NULL
)

AS

BEGIN


UPDATE fts
SET	fts.DimTicketTypeId = CASE 
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 IS NULL
			AND dpc.pc3 IS NULL 
			AND dpc.pc4 IS NULL  
		THEN 41
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z') 
			AND dpc.PC2 LIKE '3'
			AND dpc.PC3 IS NULL
			AND dpc.PC4 IS NULL   
		THEN 42 
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE '3'
			AND dpc.PC3 LIKE 'X'
			AND dpc.PC4 IS NULL 
		THEN 43 
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE '3'
			AND dpc.PC3 LIKE 'Z'
			AND dpc.PC4 IS NULL 
		THEN 44
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE '3'
			AND dpc.PC3 LIKE 'Y'
			AND dpc.PC4 IS NULL 
		THEN 45
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE 'I'
			AND dpc.PC3 LIKE 'R'
			AND dpc.PC4 IS NULL 
		THEN 46 
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE 'R'
			AND dpc.PC3 LIKE 'M'
			AND dpc.PC4 IS NULL 
		THEN 47 
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z') 
			AND dpc.PC2 LIKE 'N'
			AND dpc.PC3 LIKE 'I'
			AND dpc.PC4 IS NULL 
		THEN 48
 		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE 'N'
			AND dpc.PC3 IS NULL 
         	AND dpc.PC4 IS NULL 
		THEN 49
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE 'R'
			AND dpc.PC3 LIKE 'W'
			AND dpc.PC4 IS NULL 
		THEN 50
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE 'R'
			AND dpc.PC3 LIKE 'X'
		THEN 51
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE 'G'
			AND dpc.PC3 LIKE '2'
			AND dpc.PC4 LIKE 'I'
		THEN 52											
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE 'G'
			AND dpc.PC3 LIKE '1'
			AND dpc.PC4 LIKE 'I'					
		THEN 53											
  		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE 'G'
			AND dpc.PC3 LIKE '3'
			AND dpc.PC4 LIKE 'I'					
		--AND dpc.pc2 NOT IN (' G2I', ' G1I', ' G4I', ' G5I', ' G3') 
		THEN 54											
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE 'G'
			AND dpc.PC3 LIKE '4'
			AND dpc.PC4 LIKE 'I'					
		--AND dpc.pc2 NOT IN (' G3I', ' G1I', ' G2I', ' G5I', ' G4') 
		THEN 55
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.PC2 LIKE '5'
			AND dpc.pc3 LIKE 'Y'
			AND dpc.PC4 IS NULL
		THEN 56
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE '5'
			AND dpc.pc3 IS NULL 
			AND dpc.pc4	IS NULL 
		THEN 57
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE '5'
			AND dpc.PC3 LIKE 'Z'
			AND dpc.PC4 IS NULL
		THEN 58
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE '5'
			AND dpc.PC3 LIKE 'X'
			AND dpc.PC4 IS NULL
		THEN 59
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'W'
			AND dpc.pc3 LIKE 'Z'
			AND dpc.PC4 IS NULL
		THEN 60
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 LIKE '1'
			AND dpc.pc4 IS NULL  
		THEN 61
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'W'
			AND dpc.pc3 LIKE 'Y'
			AND dpc.PC4 IS NULL
		THEN 62
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'W'
			AND dpc.pc2 LIKE 'V'
			AND dpc.PC4 IS NULL
		THEN 63
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'W'
			AND dpc.pc3 LIKE 'T'
			AND dpc.PC4 IS NULL		
		THEN 64
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'W'
			AND dpc.pc3 LIKE '3'
			AND dpc.PC4 IS NULL
		THEN 65
 		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'N'
			AND dpc.pc3 LIKE 'M'
			AND dpc.PC4 IS NULL 
		THEN 66
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 LIKE '2'
			AND dpc.pc4 IS NULL 
		THEN 67											
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'W'
			AND dpc.pc3 LIKE 'X'
			AND dpc.PC4 IS NULL 
		THEN 68		
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.PC3 LIKE '4'
			AND dpc.pc4 IS NULL 
		THEN 69	
 		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'N'
			AND dpc.PC3 LIKE 'W'
			AND dpc.PC4 IS NULL
		THEN 70
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'S'
			AND dpc.pc3 IS NULL 
			AND dpc.PC4 IS NULL
		THEN 71
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 LIKE '5'
			AND dpc.PC4 IS NULL 
		THEN 72											
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 LIKE '2'
			AND dpc.pc4 LIKE 'W'
		THEN 73											
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 LIKE '3'
			AND dpc.PC4 IS NULL 
		THEN 74
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'O'
			AND dpc.PC3 IS NULL
			AND dpc.PC4 IS NULL
		THEN 75
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'Y'
			AND dpc.pc3 LIKE 'F'
			AND dpc.PC4 IS NULL
		THEN 76
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 LIKE '1'
			AND dpc.pc4 LIKE 'W'
		THEN 77											
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 LIKE '5'
			AND dpc.pc4 LIKE 'I'
		THEN 78
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 LIKE '5'
			AND dpc.pc4 LIKE 'W'
		THEN 79 											
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'D'
			AND dpc.pc3 LIKE '5'
			AND dpc.PC4 IS NULL
		THEN 80
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'S'
			AND dpc.pc3 LIKE 'W'
			AND dpc.PC4 IS NULL
		THEN 81
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'S'
			AND dpc.pc3 LIKE 'I'
			AND dpc.PC4 IS NULL
		THEN 82
				WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 IN ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', '1','2','3','4','5','6','7','8','9')
			AND dpc.PC4 LIKE 'W'
		THEN 83
		WHEN dpc.PC1 IN  ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
			AND dpc.pc2 LIKE 'G'
			AND dpc.pc3 IN ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', '1','2','3','4','5','6','7','8','9')
			AND dpc.PC4 LIKE 'I'
		THEN 84
		ELSE -1 
		END
FROM dbo.FactTicketSales_V2 fts 
	JOIN dbo.DimPriceCode_V2 dpc
		ON dpc.DimPriceCodeId = fts.DimPriceCodeId


UPDATE fts
SET fts.DimPlanTypeId = CASE 
		WHEN dp.PlanCode LIKE '%FS%'
			--AND dp.PlanCode <> 'OLD16FS'
			--AND dp.PlanCode <> '17FS'
		THEN 1 
		WHEN dp.PlanCode LIKE 'PACK1'
			AND dp.PlanCode  <> 'PACK2'
		THEN 2	
		WHEN dp.PlanCode LIKE 'PACK2'
			AND dp.PlanCode <> 'PACK1'
		THEN 3
		WHEN fts.DimPlanId = 0 
		THEN 4
		ELSE 4
		END 
FROM dbo.FactTicketSales_V2 fts 
	JOIN dbo.DimPlan_V2 dp 
		ON dp.DimPlanId = fts.DimPlanId


UPDATE fts
SET	fts.DimTicketClassId = CASE 
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName = 'Renewal ADA Relocations'
	THEN 1
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName = 'Renewal ADAs'
		--AND tt.TicketTypeName <> 'Relocation'
	THEN 2 
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName = 'New ADAs'
	THEN 3
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName = 'News'
	THEN 4
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName = 'Renewals'
	THEN 5
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName = 'Relocations'
		--AND tt.TicketTypeName NOT LIKE  'ADA%' 
	THEN 7 
	WHEN dp.PlanCode IS NULL 
		AND tt.TicketTypeName = 'Single Games'
	THEN 8 
	WHEN dp.PlanCode = 'PACKA'
		AND tt.TicketTypeName = 'News'
	THEN 9 
	WHEN dp.PlanCode = 'PACKA'
		AND tt.TicketTypeName = 'Renewals'
	THEN 10 
	WHEN dp.PlanCode = 'PACKA'
		AND tt.TicketTypeName = 'Relocations'
	THEN 11
	WHEN dp.PlanCode = 'PACKB'
		AND tt.TicketTypeName = 'News'
	THEN 12 
	WHEN dp.PlanCode = 'PACKB'
		AND tt.TicketTypeName = 'Renewals'
	THEN 13
	WHEN dp.PlanCode = 'PACKB'
		AND tt.TicketTypeName = 'Relocations'
	THEN 14 
	WHEN dp.PlanCode IS NULL 
		AND tt.TicketTypeName IN (
		'Group 200+s'
		,'Group 20-50 WCs'
		,'Group 50-99s'
		,'Group Under 20 WC'
		,'Group 200+ WC'
		,'Group Under 20 ticketss'
		)
		AND dp.PlanName = 'News'
	THEN 15
	WHEN dp.PlanCode IS NULL 
		AND tt.TicketTypeName IN (
		'Group 200+s'
		,'Group 20-50 WCs'
		,'Group 50-99s'
		,'Group Under 20 WC'
		,'Group 200+ WC'
		,'Group Under 20 ticketss'
		)
		AND dp.PlanName = 'Renewals'
	THEN 15
	WHEN dp.PlanCode IS NULL 
		AND ds.SeatTypeName IN (
		'Field Suite'
		,'Lower Suite'
		,'Upper Suite'
		,'QB Suite'
		) 
	THEN 16
	WHEN dp.PlanCode LIKE '%FS%'
		AND ds.SeatTypeName IN (
		'Field Suite'
		,'Lower Suite'
		,'Upper Suite'
		,'QB Suite'
		) 
	THEN 17
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName LIKE 'Single Game ADA' 
	THEN 18
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName LIKE 'Single Game Infill' 
	THEN 19
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName LIKE 'Group ADA' 
	THEN 20
	WHEN dp.PlanCode LIKE '%FS%'
		AND tt.TicketTypeName LIKE 'Group Infill' 
	THEN 21
	WHEN dp.PlanCode IS NULL 
		AND tt.TicketTypeName = 'Colts 5K GROUP'
	THEN 22 
	WHEN dp.PlanCode IS NULL 
		AND tt.TicketTypeName = 'Youth Football Group'  	
	THEN 23
	ELSE -1 
	END 	 
FROM dbo.FactTicketSales_V2 fts
	JOIN dbo.DimPlan_V2 dp 
		ON dp.DimPlanId = fts.DimPlanId  
	JOIN dbo.DimTicketType_V2 tt 
		ON tt.DimTicketTypeId = fts.DimTicketTypeId 
	LEFT JOIN dbo.DimSeatType_V2 ds
		ON ds.DimSeatTypeId = fts.DimSeatTypeId 

END 
GO
