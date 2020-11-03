FROM alpine:latest
MAINTAINER Radek Sprta <mail@radeksprta.eu>

LABEL org.opencontainers.image.authors "Radek Sprta <mail@radeksprta.eu>"
LABEL org.opencontainers.image.description "Alpine container for Ansible playbook and role testing in Molecule."
LABEL org.opencontainers.image.documentation "https://radek-sprta.gitlab.io/docker-alpine-ansible"
LABEL org.opencontainers.image.licenses "GPL-3.0"
LABEL org.opencontainers.image.source "https://gitlab.com/radek-sprta/docker-alpine-ansible"
LABEL org.opencontainers.image.title "rsprta/alpine-ansible"
LABEL org.opencontainers.image.url "https://gitlab.com/radek-sprta/docker-alpine-ansible"

ENV pip_packages "ansible cryptography"

# Install dependencies.
RUN apk --no-cache add \
       gzip \
       python3 \
       sudo \
       tar \
       wget \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man

# Install Ansible via pip.
RUN apk --update add --virtual .build-dependencies \
       build-base \
       libffi-dev \
       openssl-dev \
       python3-dev \
       py3-pip \
    && pip3 install $pip_packages \
    && apk del .build-dependencies \
    && rm -Rf /var/cache/apk/* 

# Install Ansible inventory file.
RUN mkdir -p /etc/ansible \
    && echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup", "/tmp", "/run"]

WORKDIR /etc/init.d
CMD ["/sbin/init"]
