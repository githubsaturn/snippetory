For details, see Automatically configure Telegraf and Manually update Telegraf configurations.
- https://docs.influxdata.com/influxdb/v2.0/write-data/no-code/use-telegraf/auto-config/
- https://docs.influxdata.com/influxdb/v2.0/write-data/no-code/use-telegraf/manual-config/
- https://www.influxdata.com/blog/telegraf-configuration-in-influxdb-2-0/


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



### InfluxDB Templates:

[Templates](https://github.com/influxdata/community-templates#templates) are essentially "Raedy to go" inputs/output for grafana.

For example, Docker template has parts like this:

```
    [[inputs.docker]]
      endpoint = "unix:///var/run/docker.sock"
      gather_services = false
      container_names = []
      source_tag = false
      container_name_include = []
      container_name_exclude = []
      timeout = "5s"
      perdevice = true
      total = true
      docker_label_include = []
      docker_label_exclude = []
      tag_env = []

```
