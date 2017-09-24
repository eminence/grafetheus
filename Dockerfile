FROM centos:7
RUN yum -y install python-setuptools
RUN easy_install supervisor
COPY grafana-4.5.2/ /grafana/
COPY prometheus-2.0.0-beta.5.linux-amd64/ /prometheus/

# grafana
EXPOSE 3000

# prometheus
EXPOSE 9090

VOLUME ["/data"]


CMD ["supervisord", "-c", "/data/supervisord.conf"]
