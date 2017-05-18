USE s17guest41;
GO
BACKUP DATABASE s17guest41
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\Backup\s17guest41'
	WITH FORMAT,
		MEDIANAME = 'yul_puma_db'
		NAME = 's17guest41_Database_backup';
GO