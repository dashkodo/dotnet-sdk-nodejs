FROM mcr.microsoft.com/dotnet/core/sdk:3.1

ENV NODE_VERSION 14.9.0
ENV NODE_DOWNLOAD_SHA 78b9e06c40a34ae1b7e0540bc3667459ed6439bbc4deff0bbe13f32817e8ac9c

RUN curl -SL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" --output nodejs.tar.gz \
    && echo "$NODE_DOWNLOAD_SHA nodejs.tar.gz" | sha256sum -c - \
    && tar -xzf "nodejs.tar.gz" -C /usr/local --strip-components=1 \
    && rm nodejs.tar.gz \
    && ln -s /usr/local/bin/node /usr/local/bin/nodejs\
    && npm i -g yarn @angular/cli
