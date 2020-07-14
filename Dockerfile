FROM alpine:3.12.0

RUN apk update && \
    apk add bind-tools \
            curl \ 
            httpie \ 
            iputils \
            net-tools \
            postgresql-client \
            tcpdump \
            zsh

ENTRYPOINT ["zsh"]
