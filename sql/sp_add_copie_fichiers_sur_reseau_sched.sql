USE [TX]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_copie_fichiers_sur_reseau_sched]    Script Date: 24/06/2023 15:39:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- ============================================= =============================================
-- Description: On ajoute un job à brio_sched pour être traité par NeoRefresh et on précise ou pas si c'est un job en développement/test ou pas
-- Auteur: JB
-- Creation : 22/06/2017
-- ============================================= =============================================
ALTER PROCEDURE [dbo].[sp_add_copie_fichiers_sur_reseau_sched] 
	 @inputPath varchar(512),
	 @outputPath varchar(512),
	 @filePattern varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @currentproc AS SYSNAME, @currentdatabase AS SYSNAME
	SET @currentproc = OBJECT_NAME(@@PROCID)
	SET @currentdatabase = DB_NAME()
	EXEC Tracing.dbo.Log_ProcedureCall @currentproc, @currentdatabase, '00 - LANCEMENT DE LA PROCEDURE', '0'

	BEGIN TRANSACTION ValidSched;
	
    --TRUNCATE TABLE [TX].[dbo].[t_copie_fichiers_sur_reseau_sched]

	INSERT INTO [TX].[dbo].t_copie_fichiers_sur_reseau_sched( [dir_inputpath],[dir_outputpath],[filePattern],[jour],[heure_initialisation],[heure_debut],[heure_fin],[status])
	VALUES(@inputPath, @outputPath,	@filePattern, CONVERT(varchar, GETDATE(), 112), CONVERT (time, GETDATE()), NULL, NULL, 1)

	
	COMMIT TRANSACTION ValidSched; 
END
