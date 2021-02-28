For details, see Automatically configure Telegraf and Manually update Telegraf configurations.
- https://docs.influxdata.com/influxdb/v2.0/write-data/no-code/use-telegraf/auto-config/
- https://docs.influxdata.com/influxdb/v2.0/write-data/no-code/use-telegraf/manual-config/


To setup Telegraf for For InfluxDB2 `/etc/telegraf/telegraf.conf`
* Looks like telegraf.d directory is not working

```
[[outputs.influxdb_v2]]
  urls = ["http://srv-captain--influxdb2:8086"]
  token = "123456789123456"
  organization = "my-org"
  bucket = "bucket-telegraf"
```

or better:
```
      urls = ["$INFLUX_HOST"]
      token = "$INFLUX_TOKEN"
      organization = "$INFLUX_ORG" ## Destination bucket to write into.
      bucket = "bucket-telegraf"
```

To set intervals, you can use agent > interval. More details here:
https://docs.influxdata.com/telegraf/v1.17/administration/configuration/#agent-configuration
