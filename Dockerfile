FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libssl-dev \
    cmake \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/erebe/wstunnel.git /opt/wstunnel && \
    cd /opt/wstunnel && \
    make

EXPOSE 8080

CMD ["/opt/wstunnel/wstunnel", "-s", "0.0.0.0:8080"]
