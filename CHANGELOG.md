Following features have been added:

1. Parse SLURM log file to readable format for Kibana.
2. Organize SLURM log content into fields and job-specific subfields.
3. Adds aggregate filter for merging unique job_IDs into same event.
4. Adds job duration for each job_ID.
5. Adds basic Dokcer integration.
6. Send logs or syslogs to an external ELK stack (via tcp:5044) with Filebeat / Metricbeat.
7. geoIP plug-in implementation (works for proper log files with IP info)
8. Adds fully working NGINX web-server for serving static files at `elk.nipne.ro` domain.
9. Adds additional FQDN with SSL/TLS certificate provided by [cloudflare](www.cloudflare.com). -> *basavyr.me* points to `elk.nipne.ro` ipv4. (DNS provided by cloudflarE)
10. elk.nipne.ro has a fully secured ELK stack (accessible via web) integrated with NGINX. -> can ingest any logs from external sources via TCP PORT 5044 (the logstash server).

> Check the github repo for each update with its commit details and time of completion (addition)

Github repository: [here](https://github.com/basavyr/elk_NIPNE_DFCTI)

<robert.poenaru@protonmail.ch>
