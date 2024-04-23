# Use a smaller base image
FROM node:alpine

# Install Docker prerequisites and Docker
RUN apk add --no-cache ca-certificates curl git \
    && curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-20.10.13.tgz | tar -xzC /usr/local/bin --strip-components=1

# Install Docker Compose
RUN curl -fsSL https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

RUN apk update && \
    apk add --no-cache git bash curl skopeo

RUN echo 'updated'

# Cleanup
RUN rm -rf /var/cache/apk/*
