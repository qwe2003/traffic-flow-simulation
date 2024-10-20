#!/bin/bash

# Überprüfe das Betriebssystem
os_type=$(uname)

# Benutzereingaben abfragen
read -p "Gib die IP-Adresse des Raspberry Pi ein: " ip_address
read -p "Gib den Benutzernamen für den Raspberry Pi ein: " username
read -p "Gib den Ordnerpfad auf dem Raspberry Pi ein: " directory

# Kopiere die Template-Datei und ersetze die Platzhalter
cp scripts/sync-to-pi_template.sh sync-to-pi.sh

# Abhängig vom Betriebssystem den passenden sed-Befehl verwenden
if [[ "$os_type" == "Darwin" ]]; then
    # Für macOS
    sed -i '' "s/{{IP_ADDRESS}}/$ip_address/g" sync-to-pi.sh
    sed -i '' "s/{{USER}}/$username/g" sync-to-pi.sh
    sed -i '' "s|{{DIRECTORY}}|$directory|g" sync-to-pi.sh
elif [[ "$os_type" == "Linux" ]]; then
    # Für Linux
    sed -i "s/{{IP_ADDRESS}}/$ip_address/g" sync-to-pi.sh
    sed -i "s/{{USER}}/$username/g" sync-to-pi.sh
    sed -i "s|{{DIRECTORY}}|$directory|g" sync-to-pi.sh
else
    echo "Unbekanntes Betriebssystem: $os_type. Das Script unterstützt nur macOS und Linux."
    exit 1
fi

# Setze die Rechte der neuen Datei auf ausführbar
chmod +x sync-to-pi.sh

echo "Platzhalter wurden erfolgreich ersetzt und das Script wurde in 'sync-to-pi.sh' kopiert!"
