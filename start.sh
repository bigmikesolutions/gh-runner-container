#!/bin/bash

cd /home/docker/actions-runner

./config.sh --url https://github.com/${ORGANIZATION} --token ${ACCESS_TOKEN} --name ${RUNNER_NAME} --runnergroup ${RUNNER_GROUP} --labels ${RUNNER_LABELS}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${ACCESS_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!