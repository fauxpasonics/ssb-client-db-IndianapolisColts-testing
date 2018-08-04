CREATE TABLE [email].[DimCampaign]
(
[DimCampaignId] [int] NOT NULL IDENTITY(-2, 1),
[DimCampaignTypeId] [int] NULL,
[DimChannelId] [int] NULL,
[SourceSystemID] [int] NULL,
[Src_CampaignID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Subject] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromEmail] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FromName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartDate] [datetime] NULL,
[EndDate] [datetime] NULL,
[GoalDescription] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimCampai__Creat__65E11278] DEFAULT (user_name()),
[CreatedDate] [datetime] NULL CONSTRAINT [DF__DimCampai__Creat__66D536B1] DEFAULT (getdate()),
[UpdatedBy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__DimCampai__Updat__67C95AEA] DEFAULT (user_name()),
[UpdatedDate] [datetime] NULL CONSTRAINT [DF__DimCampai__Updat__68BD7F23] DEFAULT (getdate())
)
GO
ALTER TABLE [email].[DimCampaign] ADD CONSTRAINT [PK__DimCampa__2C52FBADA9B58015] PRIMARY KEY CLUSTERED  ([DimCampaignId])
GO
ALTER TABLE [email].[DimCampaign] ADD CONSTRAINT [FK__DimCampai__DimCa__6AA5C795] FOREIGN KEY ([DimCampaignTypeId]) REFERENCES [email].[DimCampaignType] ([DimCampaignTypeId])
GO
ALTER TABLE [email].[DimCampaign] ADD CONSTRAINT [FK__DimCampai__DimCh__6B99EBCE] FOREIGN KEY ([DimChannelId]) REFERENCES [email].[DimChannel] ([DimChannelId])
GO
ALTER TABLE [email].[DimCampaign] ADD CONSTRAINT [FK__DimCampai__Sourc__6C8E1007] FOREIGN KEY ([SourceSystemID]) REFERENCES [mdm].[SourceSystems] ([SourceSystemID])
GO
