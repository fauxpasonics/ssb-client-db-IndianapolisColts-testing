CREATE TABLE [email].[FactEmailSegment]
(
[FactEmailSegmentId] [int] NOT NULL IDENTITY(-2, 1),
[DimEmailId] [int] NULL,
[DimSegmentId] [int] NULL,
[IsOptOut] [bit] NULL,
[EffectiveBeginDate] [datetime] NULL,
[EffectiveEndDate] [datetime] NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FactEmail__Creat__149C0161] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__FactEmail__Creat__1590259A] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__FactEmail__Updat__168449D3] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__FactEmail__Updat__17786E0C] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[FactEmailSegment] ADD CONSTRAINT [PK__FactEmai__024BBBD5B231944B] PRIMARY KEY CLUSTERED  ([FactEmailSegmentId])
GO
CREATE NONCLUSTERED INDEX [idx_FactEmailSegment_DimEmailId] ON [email].[FactEmailSegment] ([DimEmailId])
GO
CREATE NONCLUSTERED INDEX [idx_FactEmailSegment_DimSegmentId] ON [email].[FactEmailSegment] ([DimSegmentId])
GO
ALTER TABLE [email].[FactEmailSegment] ADD CONSTRAINT [FK__FactEmail__DimEm__1960B67E] FOREIGN KEY ([DimEmailId]) REFERENCES [email].[DimEmail] ([DimEmailID])
GO
ALTER TABLE [email].[FactEmailSegment] ADD CONSTRAINT [FK__FactEmail__DimSe__1A54DAB7] FOREIGN KEY ([DimSegmentId]) REFERENCES [email].[DimSegment] ([DimSegmentId])
GO
