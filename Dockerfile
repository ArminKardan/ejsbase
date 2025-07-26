FROM docker.arvancloud.ir/node:23-alpine AS base

# FROM oven/bun:canary-alpine AS base

# Install SSH server and other necessary packages
RUN apk add --no-cache openssh bash git

RUN apk add --no-cache libc6-compat chromium

# COPY ./linux/package.json /apps/main/package.json

# COPY ./linux/node /apps/linux/node

COPY ./run.sh /apps/run.sh

WORKDIR /apps/

RUN chmod 777 /apps/run.sh

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

EXPOSE 22  
EXPOSE 3000

CMD ["/bin/sh", "-c", "/apps/run.sh"]