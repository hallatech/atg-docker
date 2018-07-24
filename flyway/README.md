# Loading ATG schema with Flyway

- Use the `boxfuse/flyway` image
- Connect one of the Oracle Commerce ATG installation images as a bridge to generate the DDL

This is a first cut manual walk through to load ATG DDL to the core schema via a Flyway migration.
It finds the DB driver for Oracle and shares it across volumes.
It generates a few ATG DDLs to a shared volume for Flyway
The startup of the Flyway instance does a migration and runs the DDLs against the new schema.

1. `docker-compose up -d db`
   This generates volumes and the container `flyway_db_1`
2. `docker logs -f flyway_db_1` - wait until `DATABASE IS READY TO USE!` message.
3. In a separate terminal window: `docker-compose up -d atg`
   This generates volumes and the container `flyway_atg_1`
4. `docker exec -it flyway_atg_1 bash`  
    `bash-4.2# /scripts/generate-baseline.sh`  
    `bash-4.2# chmod 777 /flyway/drivers`
    `exit`  
5. `docker exec -it flyway_db_1 bash`
   `bash-4.2# sqlplus sys/Admin123@ORCLPDB1 as sysdba @/scripts/create-user.sql`
   `bash-4.2# cp /opt/oracle/product/12.2.0.1/dbhome_1/inventory/Scripts/ext/jlib/ojdbc8.jar /flyway/drivers`
   `bash-4.2# chmod +r /flyway/drivers/ojdbc8.jar`
6. `docker network inspect flyway_default`
   Get the IPV4 address for the db container: `"IPv4Address": "172.21.0.2/16",`
   replace the IP address in the line of the flyway credentials in the docker-compose file
   e.g. `command: -url=jdbc:oracle:thin:@//172.21.0.2:1521/ORCLPDB1 -user=core -password=core migrate`
7. Start flyway migration
    `docker-compose up -d flyway`

   If it fails immediately then perhaps the JDBC URL is wrong: Check the logs:
    ````
    docker logs flyway_flyway_1
    Flyway Community Edition 5.1.4 by Boxfuse

    ...
    WARNING: Connection error: IO Error: The Network Adapter could not establish the connection (caused by Connection refused) Retrying in 1 sec...
    ERROR: 
    Unable to obtain connection from database (jdbc:oracle:thin:@//localhost:1521/ORCLPDB1) for user 'core': IO Error: The Network Adapter could not establish the connection
    -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    SQL State  : 08006
    Error Code : 17002
    Message    : IO Error: The Network Adapter could not establish the connection
    ```

8. Check the result: `docker logs flyway_flyway_1`
   or
   `docker exec -it flyway_db_1 bash`
   `sqlplus core/core@ORCLPDB1`
   `select * from user_tables order by 1;`


# Clean up

1. `docker-compose down`
2. Optionally `docker volume prune`

To be continued ...
