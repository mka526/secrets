# Intentionally old base image for PoC scanning (expect CVEs)
FROM debian:10-slim

# Install common packages (more surface area => more CVEs found)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      curl \
      openssl \
      libssl1.1 \
      ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Non-root user (good practice even for PoC)
RUN useradd -m appuser
USER appuser

CMD ["bash", "-lc", "echo PoC image built; openssl version: $(openssl version); curl --version | head -n 1"]
