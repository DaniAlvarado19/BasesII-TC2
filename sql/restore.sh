
echo "Restore"
for i in {1..50};
do
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "BasesDeDatos234a" -Q "RESTORE DATABASE AdventureWorks2019 FROM  DISK = N'/AdventureWorks2019.bak' WITH MOVE 'AdventureWorks2017' TO '/AdventureWorks2019.mdf', MOVE 'AdventureWorks2017_Log' TO '/AdventureWorks2019_Log.ldf'" -C
    if [ $? -eq 0 ]
    then
        echo "setup.sql completed"
        break
    else
        echo "SQL not ready yet..."
        sleep 2
    fi
done