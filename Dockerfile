FROM goabout/serialized-ansible

MAINTAINER Go About <tech@goabout.com>

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
        python-passlib \
        python-pyasn1 \
        python-openssl \
        python-requests \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install "github3.py==1.0.0a4" "dopy==0.3.5"

# XXX Temporarily use Ansible 2.0
RUN apt-get update -q && DEBIAN_FRONTEND=noninteractive apt-get install -yq python-netaddr
COPY ansible_2.0.0.2-2_all.deb /tmp/
RUN dpkg -i /tmp/ansible_2.0.0.2-2_all.deb
