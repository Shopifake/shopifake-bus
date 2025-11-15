# Shopifake Bus (RabbitMQ)

Message broker for asynchronous communication between Shopifake microservices.

## Based On

- RabbitMQ 3 (Alpine)
- Management plugin enabled
- Prometheus metrics enabled

## Ports

- `5672`: AMQP protocol
- `15672`: Management UI
- `15692`: Prometheus metrics endpoint

## Environment Variables

- `RABBITMQ_DEFAULT_USER`: Admin username (default: guest)
- `RABBITMQ_DEFAULT_PASS`: Admin password (default: guest)

## Running Locally

```bash
docker build -t shopifake-bus .
docker run -d -p 5672:5672 -p 15672:15672 \
  -e RABBITMQ_DEFAULT_USER=admin \
  -e RABBITMQ_DEFAULT_PASS=secret \
  shopifake-bus
```

Access management UI at http://localhost:15672

## CI/CD

Images are automatically built and pushed to GHCR on push to main:
- `ghcr.io/shopifake/shopifake-bus:main`
- `ghcr.io/shopifake/shopifake-bus:sha-{commit}`
- `ghcr.io/shopifake/shopifake-bus:latest`
