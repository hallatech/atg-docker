create user core profile "DEFAULT" 
    identified by core 
    default tablespace "USERS" 
    temporary tablespace "TEMP" account unlock;

GRANT DBA TO core;

create user cata profile "DEFAULT" 
    identified by cata 
    default tablespace "USERS" 
    temporary tablespace "TEMP" account unlock;

GRANT DBA TO cata;

create user catb profile "DEFAULT" 
    identified by catb 
    default tablespace "USERS" 
    temporary tablespace "TEMP" account unlock;

GRANT DBA TO catb;

exit;
