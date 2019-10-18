FROM docker.elastic.co/logstash/logstash:7.4.0
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
#ADD pipelines.yml /usr/share/logstash/pipeline/
ADD logstash_config_files/logstashDocker.conf /usr/share/logstash/pipeline/
