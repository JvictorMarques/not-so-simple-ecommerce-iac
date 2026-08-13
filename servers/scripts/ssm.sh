#!/usr/bin/env bash
set -euo pipefail

command -v wget >/dev/null 2>&1 || { echo >&2 "wget is required but it's not installed. Aborting."; exit 1; }
command -v dpkg >/dev/null 2>&1 || { echo >&2 "dpkg is required but it's not installed. Aborting."; exit 1; }
command -v systemctl >/dev/null 2>&1 || { echo >&2 "systemctl is required but it's not installed. Aborting."; exit 1; }

function installSystemsManagerAgent() {
    apt update -y

    if [ ! -d /tmp/ssm ]; then
        mkdir /tmp/ssm
        cd /tmp/ssm || exit 1
    fi

    if [ ! -f /tmp/ssm/amazon-ssm-agent.deb ]; then
        wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
    fi

    dpkg -i amazon-ssm-agent.deb
    systemctl enable amazon-ssm-agent
    systemctl start amazon-ssm-agent
}

installSystemsManagerAgent