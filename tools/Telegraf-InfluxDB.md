For details, see Automatically configure Telegraf and Manually update Telegraf configurations.
- https://docs.influxdata.com/influxdb/v2.0/write-data/no-code/use-telegraf/auto-config/
- https://docs.influxdata.com/influxdb/v2.0/write-data/no-code/use-telegraf/manual-config/


To setup Telegraf for For InfluxDB2:
```
[[outputs.influxdb_v2]]
  urls = ["http://srv-captain--influxdb2:8086"]
  token = "123456789123456"
  organization = "my-org"
  bucket = "bucket-telegraf"
```
