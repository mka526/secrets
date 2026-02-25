FROM debian:10-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl openssl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

CMD ["bash","-lc","echo PoC image; openssl version: $(openssl version); curl --version | head -n 1"]
