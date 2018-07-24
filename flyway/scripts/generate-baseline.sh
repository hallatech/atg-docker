#! /bin/bash

# Generates the baseline SQL for flyway.

DB=oracle
TARGET_DIR=/flyway/sql
SQL_DIR=sql/install/$DB

cp $ATG_HOME/DAS/$SQL_DIR/das_ddl.sql $TARGET_DIR/V0.1__das_ddl.sql
cp $ATG_HOME/DPS/$SQL_DIR/dps_ddl.sql $TARGET_DIR/V0.2__dps_ddl.sql
cp $ATG_HOME/DSS/$SQL_DIR/dss_ddl.sql $TARGET_DIR/V0.3__dss_ddl.sql
cp $ATG_HOME/DCS/$SQL_DIR/dcs_ddl.sql $TARGET_DIR/V0.4__dcs_ddl.sql
