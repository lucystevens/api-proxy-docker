# api-proxy-docker
Simple docker setup for an API proxy using haproxy.

Used for proxying api requests from a frontend service to a separate backend request during local development

## Build
```
docker build -t haproxy-docker --build-arg API_PORT=8000  --build-arg UI_PORT=3000  .
```

### Build args
 - `API_PORT`: The port the API service is running on
 - `UI_PORT`: The port the frontend service is running on
 - `LOCALHOST`: The host API and frontend services are running on, defaults to `host.docker.internal`
 - `API_HOST`: The host the API service is running on, when this is different to the frontend host. Defaults to the `LOCALHOST` value.
 - `UI_HOST`: The host the frontend service is running on, when this is different to the API host. Defaults to the `LOCALHOST` value.

## Run
```
docker run -d -p 8080:80 --sysctl net.ipv4.ip_unprivileged_port_start=0 haproxy-docker
```
