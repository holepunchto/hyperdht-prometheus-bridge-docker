FROM node:24.15.0-bookworm@sha256:e9891237dfbb1de60ce19e9ff9fac5d73ad9c37da303ad72ff2a425ad1057e71

RUN useradd --create-home -u 4820 hyper-dht-prometheus

# Should not be changed (target loc of a volume)
ENV DHT_PROM_PROMETHEUS_TARGETS_LOC=/home/hyper-dht-prometheus/prometheus/targets.json

COPY package.json package-lock.json /home/hyper-dht-prometheus/

WORKDIR /home/hyper-dht-prometheus

RUN npm ci --omit=dev

RUN mkdir /home/hyper-dht-prometheus/prometheus

USER hyper-dht-prometheus

ENTRYPOINT ["./node_modules/.bin/bare", "./node_modules/.bin/hyper-dht-prometheus-bare"]
