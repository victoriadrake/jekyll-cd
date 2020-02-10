# Container image that runs your code
FROM alpine:latest

RUN apk add --no-cache \
    bash \
    g++ \
    gcc \
    git \
    libffi-dev \
    make \
    ruby-dev \
    ruby-full \
    zlib zlib-dev

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY action.sh /action.sh

# Code file to execute when the docker container starts up (`action.sh`)
ENTRYPOINT ["/action.sh"]