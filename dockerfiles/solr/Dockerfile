FROM solr:5-alpine

WORKDIR /opt/solr/server/solr

ADD collection1 /opt/solr/server/solr/collection1

USER root

RUN chown -R solr /opt/solr/server/solr

USER solr

