CREATE STREAM fact_tpv_avro WITH (
    PARTITIONS = 2,
    kafka_topic = 'partners.fact_tpv_avro',
    value_format = 'avro',
    key_format = 'avro'
) as
    select * from fact_tpv_csv partition by partner_name emit changes;
