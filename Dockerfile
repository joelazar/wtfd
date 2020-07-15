FROM alpine:latest

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update && \
    apk add --no-cache bind-tools \
                       curl \
                       hey \
                       httpie \
                       iputils \
                       neovim \
                       net-tools \
                       postgresql-client \
                       tcpdump \
                       zsh

COPY rootfs/ /

ENTRYPOINT ["zsh"]
