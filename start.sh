#!/bin/bash
set -e

# Start the Docker daemon in the background
dockerd-rootless.sh &

# Wait for Docker daemon to start
sleep 5

# Register the GitHub Actions runner
if [ ! -f .runner ]; then
    ./config.sh \
        --url "${GITHUB_URL}" \
        --token "${GITHUB_TOKEN}" \
        --name "${RUNNER_NAME}" \
        --labels "${RUNNER_LABELS}" \
        --runnergroup "${RUNNER_GROUP}" \
        --unattended
fi

# Run the GitHub Actions runner
exec ./run.sh