CREATE SOURCE CONNECTOR fact_tpv_csv WITH(
    "name"='fact_tpv_csv',
    "connector.class"='io.lenses.streamreactor.connect.aws.s3.source.S3SourceConnector',
    "tasks.max"='1',
    "connect.s3.kcql"='insert into partners.fact_tpv select * from ksqldb:fact_tpv_csv STOREAS `CSV_WithHeaders`',
    "connect.s3.aws.access.key"='hA6OBuvOkOLEh3xL',
    "connect.s3.aws.secret.key"='JWxAHJcuyqdTtprNX1CdDhHybqlXTUI1',
    "connect.s3.aws.region"='us-east-1',
    "connect.s3.custom.endpoint"='http://s3:9000',
    "connect.s3.vhost.bucket"='true',
    "connect.s3.aws.auth.mode"='Credentials',
    "value.converter"='org.apache.kafka.connect.storage.StringConverter'
);

CREATE STREAM fact_tpv_csv (
    partner_name varchar,
    internal_affiliation_id varchar,
    processor_name varchar,
    service varchar,
    capture_method varchar,
    payment_method varchar,
    card_brand varchar,
    installment_range varchar,
    capture_date varchar,
    subscription_indicator varchar,
    fraud_covered_indicator varchar,
    link_indicator varchar,
    split_indicator varchar,
    tpv BIGINT,
    tpc BIGINT,
    organization varchar
) WITH (
    FORMAT='DELIMITED',
    VALUE_DELIMITER=',',
    kafka_topic='fact_tpv_csv'
);
