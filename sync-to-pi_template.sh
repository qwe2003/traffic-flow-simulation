#!/bin/bash
# Synchronisiere den Source Code mit dem Raspberry Pi
rsync -avz --delete --exclude 'node_modules' ./ {{USER}}@{{IP_ADDRESS}}:{{DIRECTORY}}

# SSH-Befehl, um den Docker-Container auf dem Raspberry Pi neu zu starten
ssh {{USER}}@{{IP_ADDRESS}} << 'EOF'
cd {{DIRECTORY}}
docker-compose down
docker-compose up -d --build
EOF