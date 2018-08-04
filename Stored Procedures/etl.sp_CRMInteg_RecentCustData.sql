SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE   PROCEDURE [etl].[sp_CRMInteg_RecentCustData]
AS

TRUNCATE TABLE etl.CRMProcess_RecentCustData

DECLARE @Client VARCHAR(50)
SET @Client = 'IndianapolisColts' --updateme


		SELECT DISTINCT mac.DimCustomerId, mac.SSID, @Client AS Team
		INTO #tmpTicketSales
		FROM dbo.vwDimCustomer_ModAcctId mac
		LEFT JOIN 
		(SELECT SSB_CRMSYSTEM_CONTACT_ID
		FROM dbo.vwDimCustomer_ModAcctId
		WHERE SourceSystem LIKE 'SFDC%'
		) sf ON sf.SSB_CRMSYSTEM_CONTACT_ID = mac.SSB_CRMSYSTEM_CONTACT_ID
		WHERE mac.SourceSystem = 'TM'
		AND mac.CustomerType = 'Primary'
		AND ISNULL(mac.IsDeleted,0) = 0
		AND sf.SSB_CRMSYSTEM_CONTACT_ID IS NULL


INSERT INTO etl.CRMProcess_RecentCustData (dimcustomerid, SSID, Team)
SELECT a.dimcustomerid, SSID, Team FROM [#tmpTicketSales] a


GO
