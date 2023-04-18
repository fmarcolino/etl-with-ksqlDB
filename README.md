# etl-with-ksqlDB

Easy ETL with ksqlDB.


# Setup

- `docker-compose up -d` to run all ecosystem.
- `docker-compose exec ksqldb-server sh ksql http://ksqldb-server:8088` to run the ksql queries.

# Example 1: read CSVs on AWS S3, convert them to AVRO and save them on postgres and S3

Sql files in streams/csv-source folder.
