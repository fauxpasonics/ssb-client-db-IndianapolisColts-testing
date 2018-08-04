CREATE TABLE [mdm].[overrides_bak]
(
[OverrideID] [int] NOT NULL IDENTITY(1, 1),
[DimCustomerID] [int] NOT NULL,
[SSID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceSystem] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ElementID] [int] NULL,
[Field] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Value] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceValue] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StatusID] [int] NULL CONSTRAINT [DF_Overrides_StatusID] DEFAULT ((1)),
[CreatedDate] [datetime] NULL CONSTRAINT [DF_Overrides_CreatedDate] DEFAULT (getdate()),
[CreatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_Overrides_CreatedBy] DEFAULT (suser_sname()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF_Overrides_UpdatedDate] DEFAULT (getdate()),
[UpdatedBy] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActivatedDate] [datetime] NULL CONSTRAINT [DF_Overrides_ActivatedDate] DEFAULT (getdate()),
[DeactivatedDate] [datetime] NULL
)
GO
ALTER TABLE [mdm].[overrides_bak] ADD CONSTRAINT [PK_Overrides_OverrideID] PRIMARY KEY CLUSTERED  ([OverrideID])
GO
ALTER TABLE [mdm].[overrides_bak] ADD CONSTRAINT [UC_Overrides] UNIQUE NONCLUSTERED  ([DimCustomerID], [ElementID], [Field])
GO
CREATE NONCLUSTERED INDEX [IX_Overrides_ElementID] ON [mdm].[overrides_bak] ([ElementID])
GO
ALTER TABLE [mdm].[overrides_bak] ADD CONSTRAINT [FK_Overrides_DimCustomerID] FOREIGN KEY ([DimCustomerID]) REFERENCES [dbo].[DimCustomer] ([DimCustomerId])
GO
