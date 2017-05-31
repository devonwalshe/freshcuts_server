FROM solr:5-alpine

WORKDIR /opt/solr/server/solr

ADD collection1 /opt/solr/server/solr/collection1
ADD configsets /opt/solr/server/solr/configsets

USER root

RUN chown -R solr /opt/solr/server/solr

USER solr

