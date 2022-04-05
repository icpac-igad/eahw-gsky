FROM ubuntu:18.04
LABEL maintainer="Erick Otenyo <eotenyo@icpac.net" 

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
        ca-certificates libreadline-dev cmake openssl curl wget git bc \
        pkg-config unzip autoconf automake libtool build-essential bison flex vim less

COPY ./build_deps.sh /
RUN ./build_deps.sh

COPY ./build_pgsql.sh /
RUN ./build_pgsql.sh

COPY ./build_gdal.sh /
RUN ./build_gdal.sh

COPY ./build_postgis.sh /
RUN ./build_postgis.sh

COPY ./build_go.sh /
RUN ./build_go.sh

COPY ./build_webhook.sh /
RUN ./build_webhook.sh

ARG gsky_repo
ARG gsky_branch
COPY ./build_gsky.sh /
RUN ./build_gsky.sh "$gsky_repo" "${gsky_branch}"

COPY ./setup_mas.sh /
RUN ./setup_mas.sh

COPY "./gsky_config.json" /gsky/etc/config.json

COPY ./gsky_entrypoint.sh /
COPY ./ingest.sh /
COPY ./ingest_data.sh /
COPY ./reload_ows_config.sh /

COPY ./hooks.conf /hooks.conf

ENV TZ=Africa/Nairobi

EXPOSE 8080
EXPOSE 8888
EXPOSE 9000