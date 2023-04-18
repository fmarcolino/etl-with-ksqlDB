CREATE SINK CONNECTOR fact_tpv_csv_to_s3_parquet WITH(
    "name"='fact_tpv_csv_to_s3',
    "connector.class"='io.lenses.streamreactor.connect.aws.s3.sink.S3SinkConnector',
    "tasks.max"='1',
    "topics"='fact_tpv_avro',
    "connect.s3.kcql"='INSERT INTO ksqldb:fact_tpv_avro SELECT * FROM fact_tpv_avro PARTITIONBY _key STOREAS `parquet` WITH_FLUSH_INTERVAL = 60 WITH_FLUSH_SIZE = 10000',
    "connect.s3.aws.access.key"='hA6OBuvOkOLEh3xL',
    "connect.s3.aws.secret.key"='JWxAHJcuyqdTtprNX1CdDhHybqlXTUI1',
    "connect.s3.aws.region"='us-east-1',
    "connect.s3.custom.endpoint"='http://s3:9000',
    "connect.s3.vhost.bucket"='true',
    "connect.s3.aws.auth.mode"='Credentials',
    "key.converter"='io.confluent.connect.avro.AvroConverter',
    "key.converter.schemas.enable"='true',
    "key.converter.schema.registry.url"='http://schema-registry:8081',
    "value.converter"='io.confluent.connect.avro.AvroConverter',
    "value.converter.schema.registry.url"='http://schema-registry:8081'
);



CREATE SINK CONNECTOR fact_tpv_csv_to_postgres WITH(
    "name"='fact_tpv_csv_to_postgres',
    "connector.class"='io.confluent.connect.jdbc.JdbcSinkConnector',
    "tasks.max"='1',
    "topics"='fact_tpv_avro',
    "connection.url"='jdbc:postgresql://postgres/ksqldb?currentSchema=public',
    "connection.user"='ksqldb',
    "connection.password"='ksqldb',
    "dialect.name"='PostgreSqlDatabaseDialect',
    "table.name.format"='RebateTpvCreditCard',
    "insert.mode"='upsert',
    "pk.mode"='record_key',
    "pk.fields"='PARTNER_NAME',
    "auto.create"='true',
    "auto.evolve"='true',
    "delete.enabled"='true',
    "key.converter"='io.confluent.connect.avro.AvroConverter',
    "key.converter.schemas.enable"='true',
    "key.converter.schema.registry.url"='http://schema-registry:8081',
    "value.converter"='io.confluent.connect.avro.AvroConverter',
    "value.converter.schemas.enable"='true',
    "value.converter.schema.registry.url"='http://schema-registry:8081'
);
