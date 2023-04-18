# etl-with-ksqlDB

Easy ETL with ksqlDB.


# Setup

- `docker-compose up -d` to run all ecosystem.
- `docker-compose exec ksqldb-server sh ksql http://ksqldb-server:8088` to run the ksql queries.

# Example 1: read CSVs on AWS S3, convert them to AVRO and save them on postgres and S3 .parquet files

This way allows you to run queries with AWS Athena or Redshift Spectrum.

Pre-requisit: [Download Lenses plugin](https://github.com/lensesio/stream-reactor/releases/download/4.2.0/kafka-connect-aws-s3-4.2.0.zip) to read s3 data and move it to `./plugins` folder.



Sql files in `./streams/csv-source` folder.
