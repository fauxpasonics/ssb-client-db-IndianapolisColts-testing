SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE   VIEW [dbo].[DimTicketClass] AS (

    SELECT CAST(DimTicketClassId as int) AS DimTicketClassId
        , CAST(TicketClassCode as nvarchar(50)) AS TicketClassCode
        , CAST(TicketClassName as nvarchar(255)) AS TicketClassName
        , CAST(TicketClassDesc as nvarchar(255)) AS TicketClassDesc
        , CAST(NULL as nvarchar(255)) AS TicketClassGroup
        , CAST(NULL as nvarchar(255)) AS CreatedBy
        , CAST(NULL as nvarchar(255)) AS UpdatedBy
        , CAST(ETL__CreatedDate as datetime) AS CreatedDate
        , CAST(ETL__UpdatedDate as datetime) AS UpdatedDate
        , CAST(ETL__IsDeleted as bit) AS IsDeleted
        , CAST(NULL as datetime) AS DeletedDate
        , CAST(ETL__DeltaHashKey as binary) AS DeltaHashKey
        , CAST(TicketClass as nvarchar(255)) AS TicketClassType

    FROM ro.vw_DimTicketClass
    
	)

GO
