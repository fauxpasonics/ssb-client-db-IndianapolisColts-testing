SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

	CREATE   VIEW [dbo].[vw_DimTicketType] AS (

    SELECT TOP 1 CAST(DimTicketTypeId as int) AS DimTicketTypeId
        , CAST(TicketTypeCode as nvarchar(50)) AS TicketTypeCode
        , CAST(TicketTypeName as nvarchar(255)) AS TicketTypeName
        , CAST(TicketTypeDesc as nvarchar(255)) AS TicketTypeDesc
        , CAST(TicketTypeClass as nvarchar(255)) AS TicketTypeClass
        , CAST(NULL as nvarchar(255)) AS CreatedBy
        , CAST(NULL as nvarchar(255)) AS UpdatedBy
        , CAST(ETL__CreatedDate as datetime) AS CreatedDate
        , CAST(ETL__UpdatedDate as datetime) AS UpdatedDate
        , CAST(ETL__IsDeleted as bit) AS IsDeleted
        , CAST(NULL as datetime) AS DeletedDate

    FROM ro.vw_DimTicketType

	)
    
GO
