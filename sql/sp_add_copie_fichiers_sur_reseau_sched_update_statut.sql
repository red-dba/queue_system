USE [TX]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_copie_fichiers_sur_reseau_sched_update_statut]    Script Date: 24/06/2023 15:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- ============================================= =============================================
-- Description: On ajoute un job à brio_sched pour être traité par NeoRefresh et on précise ou pas si c'est un job en développement/test ou pas
-- Auteur: JB
-- Creation : 22/06/2017
-- ============================================= =============================================
ALTER PROCEDURE [dbo].[sp_add_copie_fichiers_sur_reseau_sched_update_statut] 
	 @id_demande int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @currentproc AS SYSNAME, @currentdatabase AS SYSNAME
	SET @currentproc = OBJECT_NAME(@@PROCID)
	SET @currentdatabase = DB_NAME()
	EXEC Tracing.dbo.Log_ProcedureCall @currentproc, @currentdatabase, '00 - LANCEMENT DE LA PROCEDURE', '0'

	BEGIN TRANSACTION ValidSched;
	
    --TRUNCATE TABLE [TX].[dbo].[t_copie_fichiers_sur_reseau_sched]

	UPDATE [TX].[dbo].t_copie_fichiers_sur_reseau_sched
	SET [heure_fin] = Convert(time(0), GETDATE()),[status] = 2
	WHERE id_demande = @id_demande
	
	COMMIT TRANSACTION ValidSched; 
END
