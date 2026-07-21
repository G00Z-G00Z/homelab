#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ENV_FILE="$SCRIPT_DIR/.env"

if [[ ! -f "$ENV_FILE" ]]; then
    echo "Error: .env not found. Copy .env.example to .env first."
    exit 1
fi

source "$ENV_FILE"

declare -a PORTS=(
    "${PORT_DNS_TCP:-53}/tcp"
    "${PORT_DNS_UDP:-53}/udp"
    "${PORT_HTTP:-80}/tcp"
    "${PORT_HTTPS:-443}/tcp"
)

echo "Adding UFW rules for Pi-hole..."

for port in "${PORTS[@]}"; do
    if ! sudo ufw status | grep -q "$port"; then
        sudo ufw allow "$port"
        echo "  ✓ $port"
    else
        echo "  ⊘ $port (already allowed)"
    fi
done

echo "Done. Run 'sudo ufw status' to verify."
