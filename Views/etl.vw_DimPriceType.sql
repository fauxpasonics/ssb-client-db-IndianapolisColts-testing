SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [etl].[vw_DimPriceType] AS ( SELECT * FROM dbo.DimPriceType_V2 )
GO
