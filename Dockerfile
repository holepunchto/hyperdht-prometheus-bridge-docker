FROM node:24.15.0-bookworm@sha256:e9891237dfbb1de60ce19e9ff9fac5d73ad9c37da303ad72ff2a425ad1057e71

RUN useradd --create-home -u 4820 hyperdht-prometheus-bridge

# Should not be changed (target loc of a volume)
ENV DHT_PROM_PROMETHEUS_TARGETS_LOC=/home/hyperdht-prometheus-bridge/prometheus/targets.json

COPY package.json package-lock.json /home/hyperdht-prometheus-bridge/

WORKDIR /home/hyperdht-prometheus-bridge

RUN npm ci --omit=dev

RUN mkdir /home/hyperdht-prometheus-bridge/prometheus

USER hyperdht-prometheus-bridge

ENTRYPOINT ["./node_modules/.bin/bare", "./node_modules/.bin/hyperdht-prometheus-bridge-bare"]
