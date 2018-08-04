SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]
AS
BEGIN

    /* TM */
    EXEC MDM.etl.LoadDimCustomer @ClientDB = 'IndianapolisColts',
                                 @LoadView = 'etl.vw_Load_DimCustomer_TM',
                                 @LogLevel = '0',
                                 @DropTemp = '1',
                                 @IsDataUploaderSource = '0';

    /* SalesForce */
    EXEC MDM.etl.LoadDimCustomer @ClientDB = 'IndianapolisColts',
                                 @LoadView = 'etl.vw_Load_DimCustomer_SFDCContact',
                                 @LogLevel = '0',
                                 @DropTemp = '1',
                                 @IsDataUploaderSource = '0';

    /* MSCRM */
    EXEC MDM.etl.LoadDimCustomer @ClientDB = 'IndianapolisColts',
                                 @LoadView = 'etl.vw_Load_DimCustomer_SFDCAccount',
                                 @LogLevel = '0',
                                 @DropTemp = '1',
                                 @IsDataUploaderSource = '0';


END;

GO
