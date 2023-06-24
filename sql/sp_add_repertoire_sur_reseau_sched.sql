USE [TX]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_repertoire_sur_reseau_sched]    Script Date: 24/06/2023 15:26:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- ============================================= =============================================
-- Description: On ajoute un job � t_creation_repertoire_sur_reseau_sched pour �tre trait� par CreateDirectoryIfNotExists_reseau
-- Auteur: Johan JEZEQUEL
-- Creation : 22/06/2017
-- Modification : 11/10/2019 - On ne fait plus le TRUNCATE pour pouvoir demander plusieurs cr�ations de r�pertoire
-- ============================================= =============================================
ALTER PROCEDURE [dbo].[sp_add_repertoire_sur_reseau_sched] 
	 @dir_path varchar(512),
	 @dir_name varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @currentproc AS SYSNAME, @currentdatabase AS SYSNAME
	SET @currentproc = OBJECT_NAME(@@PROCID)
	SET @currentdatabase = DB_NAME()
	EXEC Tracing.dbo.Log_ProcedureCall @currentproc, @currentdatabase, '00 - LANCEMENT DE LA PROCEDURE', '0'

	BEGIN TRANSACTION ValidSched;
	
    --TRUNCATE TABLE [TX].[dbo].[t_creation_repertoire_sur_reseau_sched]

	INSERT INTO [TX].[dbo].[t_creation_repertoire_sur_reseau_sched]([dir_path],[dir_name],[jour],[heure_initialisation],[heure_debut],[heure_fin],[status])
	VALUES(@dir_path, @dir_name, CONVERT(varchar, GETDATE(), 112), CONVERT (time, GETDATE()), NULL, NULL, 1)

	
	COMMIT TRANSACTION ValidSched; 
END
