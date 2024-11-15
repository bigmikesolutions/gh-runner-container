FROM ubuntu:20.04

# deefault region: Europe
ARG REGION=8
ARG RUNNER_VERSION="2.320.0"
ARG RUNNER_NAME="bms-ds1522-runner1"
ARG RUNNER_GROUP="Default"
ARG RUNNER_LABELS="self-hosted,Linux,X64"

RUN apt-get update -y && apt-get upgrade -y 

# install docker as a default dependency
RUN apt-get install -y \
    curl \
    sudo \
    ca-certificates \
    lsb-release \
    jq \
    git \
    docker.io 

# install runner
RUN useradd -m github
RUN adduser github sudo

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    curl jq build-essential libssl-dev libffi-dev \
    python3 python3-venv python3-dev python3-pip \
    libicu-dev

RUN cd /home/github && mkdir actions-runner && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN chown -R github ~github && echo ${REGION} /home/github/actions-runner/bin/installdependencies.sh

COPY start.sh start.sh

RUN chmod +x start.sh

USER github

ENTRYPOINT ["./start.sh"]