FROM node:24.22.3-bookworm@sha256:9d266751ca3d7fdbe651c878ffd5ad0a42fed49a18c283509267c97f025b7496

RUN useradd --create-home -u 4820 hyperdht-prometheus-bridge

# Should not be changed (target loc of a volume)
ENV DHT_PROM_PROMETHEUS_TARGETS_LOC=/home/hyperdht-prometheus-bridge/prometheus/targets.json

COPY package.json package-lock.json /home/hyperdht-prometheus-bridge/

WORKDIR /home/hyperdht-prometheus-bridge

RUN npm ci --omit=dev

RUN mkdir /home/hyperdht-prometheus-bridge/prometheus

USER hyperdht-prometheus-bridge

ENTRYPOINT ["./node_modules/.bin/bare", "./node_modules/.bin/hyperdht-prometheus-bridge-bare"]
