FROM debian:stable-slim
RUN apt-get update && apt-get install -y \
  wget \
  xz-utils \
  ca-certificates \
  openssl \
  curl \
  graphicsmagick \
  nodejs \
  python \
  unzip \
  git \
  libstdc++ \
  && rm -rf /var/lib/apt/lists/*
RUN wget https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz && \
    mkdir sfdx && \
    tar xJf sfdx-linux-amd64.tar.xz -C sfdx --strip-components 1 && \
    ./sfdx/install && \
    rm -rf sfdx
RUN sfdx update
RUN wget https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip \
    && unzip BrowserStackLocal-linux-x64.zip \
    && chmod +x BrowserStackLocal \
    && mv BrowserStackLocal /usr/local/bin \
    && rm BrowserStackLocal-linux-x64.zip
CMD ["sfdx"]
