FROM goabout/serialized-ansible

MAINTAINER Go About <tech@goabout.com>

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        python-pyasn1 \
        python-openssl \
        python-requests \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install "github3.py>=1.0.0a"

COPY boto.cfg /etc/boto.cfg
