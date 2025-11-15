# RabbitMQ Message Bus for Shopifake
FROM rabbitmq:3-management-alpine

# Enable RabbitMQ plugins
RUN rabbitmq-plugins enable --offline rabbitmq_management rabbitmq_prometheus

# Health check
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD rabbitmq-diagnostics ping || exit 1

# Expose ports
# 5672: AMQP
# 15672: Management UI
# 15692: Prometheus metrics
EXPOSE 5672 15672 15692

# Default environment variables (can be overridden)
ENV RABBITMQ_DEFAULT_USER=guest
ENV RABBITMQ_DEFAULT_PASS=guest

