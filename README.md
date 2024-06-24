# Monitoring Setup with Grafana, Prometheus, Node Exporter, and Jaeger

[![License](https://img.shields.io/github/license/Naereen/StrapDown.js.svg)](LICENSE)

This project sets up a monitoring stack using Docker Compose, featuring Prometheus, Grafana, Node Exporter, and Jaeger.

## Prerequisites

- Docker
- Docker Compose

## File Structure

```
.
├── docker-compose.yml
├── grafana
│   ├── grafana.ini
│   └── grafana.ini.example
├── Makefile
└── prometheus
    └── prometheus.yml
```

## Docker Compose Configuration

### `docker-compose.yml`

This file defines the services for Prometheus, Grafana, Node Exporter, and Jaeger.

- **Prometheus**:

  - Uses the `prom/prometheus:latest` image.
  - Configuration file located at `./prometheus/prometheus.yml`.
  - Data stored in `./prometheus/data`.
  - Accessible on port `9090`.

- **Grafana**:

  - Uses the `grafana/grafana:latest` image.
  - Configuration file located at `./grafana/grafana.ini`.
  - Data stored in a Docker volume `grafana-storage`.
  - Accessible on port `9630`.
  - Admin credentials set via environment variables.

- **Node Exporter**:

  - Uses the `prom/node-exporter:latest` image.
  - Exposes system metrics.
  - Accessible on port `9100`.

- **Jaeger**:
  - Uses the `jaegertracing/all-in-one:latest` image.
  - Exposes ports for receiving traces and a web UI.
  - Accessible on ports `6831/udp` and `16686`.

### Volumes

- `grafana-storage`: Persistent storage for Grafana data.

## Prometheus Configuration

### `prometheus/prometheus.yml`

Defines scrape configurations for Prometheus:

- **node_exporter**:

  - Scrapes metrics from the Node Exporter service.

- **loopback4**:
  - Scrapes metrics from a LoopBack 4 API server at `192.168.15.37:9464`.

## Grafana Configuration

### `grafana/grafana.ini`

SMTP configuration for sending alerts. Ensure to replace the placeholder values with actual SMTP credentials.

### `grafana/grafana.ini.example`

An example configuration file with placeholder values for SMTP settings.

## Makefile

The `Makefile` provides convenient commands for managing the Docker Compose services.

### Targets

- **up**: Start Docker Compose services
- **down**: Stop Docker Compose services
- **build**: Build Docker Compose services
- **logs**: View logs of Docker Compose services
- **ps**: List Docker Compose services
- **restart**: Restart Docker Compose services
- **clean**: Remove all Docker Compose services and their data
- **install-dependencies**: Install npm dependencies (optional)
- **help**: Display help message

### Usage

Run the following commands in your terminal:

- Start services: `make up`
- Stop services: `make down`
- Build services: `make build`
- View logs: `make logs`
- List services: `make ps`
- Restart services: `make restart`
- Clean up services: `make clean`
- Install dependencies: `make install-dependencies`

## Getting Started

1. Clone this repository.
2. Configure Grafana SMTP settings in `grafana/grafana.ini`.
3. Start the services:

   ```bash
   make up
   ```

4. Access Grafana at `http://localhost:9630` with username `admin` and password `admin`.
5. Access Prometheus at `http://localhost:9090`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

For more information, visit the official documentation for [Prometheus](https://prometheus.io/docs/), [Grafana](https://grafana.com/docs/), [Node Exporter](https://prometheus.io/docs/guides/node-exporter/), and [Jaeger](https://www.jaegertracing.io/docs/).
