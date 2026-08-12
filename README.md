# hyperdht-prometheus-bridge-docker
Build and publish container for hyperdht-prometheus-bridge

```
docker run --network host --env HYPERDHT_PROM_SHARED_SECRET=<A 64 character hex string> --mount type=bind,source=/etc/prometheus/config/prometheus-dht-targets,destination=/home/hyperdht-prometheus-bridge/prometheus ghcr.io/holepunchto/hyperdht-prometheus-bridge-docker
```

The intent is for the prometheus service to read its config from a read-only bind mount to `/etc/prometheus/config`, and for its config file to reference `./prometheus-dht-targets/targets.json`

Note: `/etc/prometheus/config/prometheus-dht-targets` should be writable by the container's user.

Note: `--network=host` is optional, but HyperDHT holepunching can struggle using the default bridge network, particularly for LAN and localhost connections.
