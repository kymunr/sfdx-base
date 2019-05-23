FROM debian:stable-slim
RUN apt-get update && apt-get install -y \
  wget \
  xz-utils \
  ca-certificates \
  openssl \
  && rm -rf /var/lib/apt/lists/*
RUN wget https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz && \
    mkdir sfdx && \
    tar xJf sfdx-linux-amd64.tar.xz -C sfdx --strip-components 1 && \
    ./sfdx/install && \
    rm -rf sfdx
RUN sfdx update
CMD ["sfdx"]
