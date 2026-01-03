restore Database Cars
from disk = 'F:\Programming Advices\C# Language\Sql Sxercice\DataBase\VehicleMakesDB.bak'
with
move 
'T1' to 'D:\System\Sql Server\MSSQL16.MSSQLSERVER1\MSSQL\DATA\VehicleMakesDB.mdf',
move
'T1_log' to 'D:\System\Sql Server\MSSQL16.MSSQLSERVER1\MSSQL\DATA\VehicleMakesDB_log.mdf'

