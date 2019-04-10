FROM jenkins/jnlp-slave

LABEL maintainer="liuchunming033@163.com"

USER root

ENV PYTHON_VERSION 3.5

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get -y install python${PYTHON_VERSION} \
       libffi-dev \
       libpq-dev \
       libssl-dev \
       python3-dev \
       python3-pip \
       python3-setuptools \
       python3-venv \
       python3-wheel \
       build-essential \
       docker \
    && rm -rf /var/lib/apt/lists/* \
    && ln -nsf /usr/bin/python${PYTHON_VERSION} /usr/bin/python

ADD requirements.txt  /home/jenkins
RUN pip3 install -r /home/jenkins/requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple --trusted-host pypi.tuna.tsinghua.edu.cn
#USER jenkins
