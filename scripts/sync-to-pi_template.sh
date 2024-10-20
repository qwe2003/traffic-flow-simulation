#!/bin/bash
# Synchronisiere den Source Code mit dem Raspberry Pi
rsync -avz --delete --exclude 'node_modules' ./ {{USER}}@{{IP_ADDRESS}}:{{DIRECTORY}}

# SSH-Befehl, um den Docker-Container auf dem Raspberry Pi neu zu starten
ssh {{USER}}@{{IP_ADDRESS}} << 'EOF'
cd {{DIRECTORY}}
docker stop traffic-flow-simulator || true
docker rm traffic-flow-simulator || true
docker build -t traffic-flow-simulator .
docker run -d -p 3000:3000 --name traffic-flow-simulator traffic-flow-simulator
EOF