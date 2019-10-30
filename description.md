# Project for ELK service with custom log files

Project structure:

1.Config files for logstash -> `logstash_config_files/` directory (reads data,parses data,sends data to elastic)

2.Config files for Filebeat -> `filebeat_config_files/` directory (reads log files, sends *unprocessed* data to logstash)

3.Input log files for config testing -> `input_logs/` directory (currently only SLURM example)

4.Config files for metricbeat -> `metricbeat_config_files/` directory (sends metric logs to any logstash server or es server stack)

5.The parsed data is also stored on local files (not only Elastic/Kibana) preferably in JSON format (easy read)  -> `output_logs/` directory.


Current setup:
 * Elastic server running on localhost:9200 (sends data to Kibana for visualization) > added reverse proxy for external access (HTTPS)
 * Kibana running on localhost:5601 > added reverse proxy for external access (HTTPS)
 * Logstash setup for parsing custom log file (Grok filter) -> parsed data is sent to Elastic
 * Kibana recieves the parsed data (by logstash) from Elastic

### NGINX

The CentOS VM has now a fully working web-server configured excuslively with [NGINX](www.nginx.com).
The web-server is serving static files from the `html` directory in `/var/www/elk.nipne.ro/html` via HTTP requests.
> [ELK@DFCTI](https://elk.nipne.ro)

The characteristics of NGINX web-server:
 * Server listens on port 443 (SSL support) and redirects every HTTP request to HTTPS.
 * the VM has a valid domain name `elk.nipne.ro` and also a FQDN managed by cloudflare.com (A NAME) `basavyr.me` which points to the ipv4 of the CentOS machine.
 * the VM has firewall enabled so only traffic on ports 80 and 443 is opened.
 * Server has a valid certificate (managed by Let's Encrypt).
 * Server suports HTTP2.

## TO-DO(s)

> Follow the [CHANGELOG](CHANGELOG.md) file for latest updates!

A. <span style="color:green">**COMPLETED** </span> Optimal setup  

B.  <span style="color:green">**COMPLETED** </span> ~~Change key value ordering (make `job_id` main index field)~~ 

C.  <span style="color:green">**COMPLETED** </span> ~~Add task duration for each job~~ 

D. Identify the job senders 

E. ~~Basic~~ **Advanced** Docker integration > *in progress* <span style="color:green"> PRIORITY C

F. Multiple sources logging > *in progress* <span style="color:red"> PRIORITY A
 
 * Ingest data from multiple servers/VMs
 * Set-up logstash pipeline for incoming traffic and output to Elastic search server running on `elk.nipne.ro` -> `pipelines.yml` configuration
 *  <span style="color:green">**COMPLETED** </span> Current method i: send logs with Filebeat to an external ELK stack (through TCP on PORT:5044)
 *  <span style="color:green">**COMPLETED** </span> Current method ii: send syslogs with Metric to an external ELK stack (through TCP on PORT:5044)
 *  <span style="color:green">**COMPLETED** </span> Data is sent to a central Logstash running on a CentOS 7 based [Droplet](www.digitalocean.com). The ingested data is parsed, then sent to Elasticsearch (running on the localhost) and form there is sent further to Kibana for vizualization (Kibana running also on localhost).
 * <span style="color:green">**COMPLETED** </span> **IMPORTANT** Encrypt communication with SSL/TLS encryption for Filebeat/Metricbeat---->Logstash-->Elastic-->Kibana pipeline. <span style="color:red"> PRIORITY A
 * See [diagram](https://drive.google.com/file/d/1r5QYCd67KvK9XYAC4NN5SzSBtFVmxniv/view?usp=sharing)
 * See [local diagram](ELKsetupDFCTI.png)

G. Create a final Docker image/container with the entire project PIPELINE

H. **COMPLETED** Send systemlogs with Filebeat/Metricbeat from DigitalOcean droplet (*centOS 7* VM) to `ELK` server. *in progress* <span style="color:orange">(PRIORITY B)
    
    * Full TLS/SSL encryption and valid certificates on the `elk.nipne.ro` server.

 

I. Implement `geoip` into logstash data parsing. > *in progress* <span style="color:orange"> PRIORITY B

J. <span style="color:green">**COMPLETED** </span> Generate SSL certificates for securing LOGSTASH, ELASTICSEARCH and KIBANA on the `elk.nipne.ro` machine. <span style="color:red"> PRIORITY A

K. Update diagram with current ELK server set-up <span style="color:red"> PRIORITY A

Project Author: <robert.poenaru@protonmail.ch>