USE [TX]
GO

EXEC sys.sp_dropextendedproperty @name=N'Créateur' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_copie_fichiers_sur_reseau_sched'
GO

/****** Object:  Table [dbo].[t_copie_fichiers_sur_reseau_sched]    Script Date: 23/06/2023 14:49:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[t_copie_fichiers_sur_reseau_sched]') AND type in (N'U'))
DROP TABLE [dbo].[t_copie_fichiers_sur_reseau_sched]
GO

/****** Object:  Table [dbo].[t_copie_fichiers_sur_reseau_sched]    Script Date: 23/06/2023 14:49:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_copie_fichiers_sur_reseau_sched](
	[id_demande] [bigint] IDENTITY(1,1) NOT NULL,
	[dir_inputpath] [varchar](512) NOT NULL,
	[dir_outputpath] [varchar](512) NOT NULL,
	[filePattern] [varchar](255) NOT NULL,
	[jour] [varchar](8) NOT NULL,
	[heure_initialisation] [time](0) NOT NULL,
	[heure_debut] [time](0) NULL,
	[heure_fin] [time](0) NULL,
	[status] [int] NOT NULL
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'Créateur', @value=N'JJ - 26/06/2019' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_copie_fichiers_sur_reseau_sched'
GO


