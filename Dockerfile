FROM registry.access.redhat.com/rhel7:latest

USER root

RUN yum-config-manager --enable rhel-server-rhscl-7-rpms && \
    yum-config-manager --enable rhel-7-server-optional-rpms && \
    yum -y install ca-certificates wget

COPY grafana.repo /etc/yum.repos.d/grafana.repo

RUN yum repolist
RUN yum install -y grafana
RUN wget -O /run.sh https://raw.githubusercontent.com/grafana/grafana/master/packaging/docker/run.sh

USER grafana
CMD ["/run.sh"]
EXPOSE 3000

