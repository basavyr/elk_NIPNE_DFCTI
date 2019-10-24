# Project for ELK service with custom log files

Project structure:

1.Config files for logstash -> `logstash_config_files/` directory (reads data,parses data,sends data to elastic)

2.Config files for Filebeat -> `filebeat_config_files/` directory (reads log files, sends *unprocessed* data to logstash)

3.Input log files for config testing -> `input_logs/` directory (currently only SLURM example)

4.The parsed data is also stored on local files (not only Elastic/Kibana) preferably in JSON format (easy read)  -> `output_logs/` directory.


Current setup:
 * Elastic server running on localhost:9200 (sends data to Kibana for visualization)
 * Kibana running on localhost:5601
 * Logstash setup for parsing custom log file (Grok filter) -> parsed data is sent to Elastic
 * Kibana recieves the parsed data (by logstash) from Elastic

## to-do(s)

> Follow the [CHANGELOG](CHANGELOG.md) file for latest updates!

A. Optimal setup (**NOT IMPLEMENTED YET**):
 * Elastic server
 * Kibana
 * Filebeat reads log files and outputs them to Logstash (instead of default elastic output)
 * Logstash recieves filebeat logs and parses them into proper format.
 * Parsed logs are sent to elastic -> kibana

B. ~~Change key value ordering (make `job_id` main index field)~~ 

C. ~~Add task duration for each job~~ 

D. Identify the job senders 

E. ~~Basic~~ **Advanced** Docker integration > *in progress* <span style="color:green"> PRIORITY C

F. Multiple sources logging > *in progress* <span style="color:red"> PRIORITY A
 
 * Ingest data from multiple servers/VMs
 * Set-up logstash pipeline for incoming traffic and output to Elastic search server running on `elk.nipne.ro` -> `pipelines.yml` configuration
 * Current method i: send logs with Filebeat to an external ELK stack (through TCP on PORT:5044)
 * Current method ii: send syslogs with Metric to an external ELK stack (through TCP on PORT:5044)
 * Data is sent to a central Logstash running on a CentOS 7 based [Droplet](www.digitalocean.com). The ingested data is parsed, then sent to Elasticsearch (running on the localhost) and form there is sent further to Kibana for vizualization (Kibana running also on localhost).
 * **IMPORTANT** Encrypt communication with SSL/TLS encryption for Filebeat/Metricbeat---->Logstash-->Elastic-->Kibana pipeline. <span style="color:red"> PRIORITY A
 * See [diagram](https://drive.google.com/file/d/1r5QYCd67KvK9XYAC4NN5SzSBtFVmxniv/view?usp=sharing)
 * See [local diagram](ELKsetupDFCTI.png)

G. Create a final Docker image/container with the entire project PIPELINE

H. Send systemlogs with Filebeat/Metricbeat from DigitalOcean droplet (*centOS 7* VM) to `ELK` server. *in progress* <span style="color:orange">(PRIORITY B)

I. Implement `geoip` into logstash data parsing. > *in progress* <span style="color:orange"> PRIORITY B

J. Generate SSL certificates for securing LOGSTASH, ELASTICSEARCH and KIBANA on the `elk.nipne.ro` machine. <span style="color:red"> PRIORITY A

Project Author: <robert.poenaru@protonmail.ch>