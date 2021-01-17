FROM golang:1.15-buster

COPY . /pktd

RUN groupadd -g 1001 packetcrypt && \
# Add packetcrypt_miner user
    useradd \
        -s /bin/bash \
        -u 1000 \
        -g packetcrypt \
        --create-home \
        --home /home/custodian \
        pkt_custodian && \
# Set permissions
    chown -R pkt_custodian /pktd

WORKDIR /pktd

USER pkt_custodian:packetcrypt

RUN /bin/sh -c './do'

CMD ["tail", "-f", "/dev/null"]
