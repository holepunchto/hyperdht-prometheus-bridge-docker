FROM node:24.22.1-bookworm@sha256:6449e19d8184d84062525b6a7524def03146c2cb04a7f08b076680d0e8e4240a

RUN useradd --create-home -u 4820 hyperdht-prometheus-bridge

# Should not be changed (target loc of a volume)
ENV DHT_PROM_PROMETHEUS_TARGETS_LOC=/home/hyperdht-prometheus-bridge/prometheus/targets.json

COPY package.json package-lock.json /home/hyperdht-prometheus-bridge/

WORKDIR /home/hyperdht-prometheus-bridge

RUN npm ci --omit=dev

RUN mkdir /home/hyperdht-prometheus-bridge/prometheus

USER hyperdht-prometheus-bridge

ENTRYPOINT ["./node_modules/.bin/bare", "./node_modules/.bin/hyperdht-prometheus-bridge-bare"]
