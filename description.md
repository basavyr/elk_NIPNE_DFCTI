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

A. Optimal setup (**NOT IMPLEMENTED YET**):
 * Elastic server
 * Kibana
 * Filebeat reads log files and outputs them to Logstash (instead of default elastic output)
 * Logstash recieves filebeat logs and parses them into proper format.
 * Parsed logs are sent to elastic -> kibana

B. Change key value ordering (make `job_id` main index field) 

C. Add task duration for each job 

D. Identify the job senders 

<robert.poenaru@protonmail.ch>