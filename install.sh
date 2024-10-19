#!/bin/bash

# Benutzereingaben abfragen
read -p "Gib die IP-Adresse des Raspberry Pi ein: " ip_address
read -p "Gib den Benutzernamen für den Raspberry Pi ein: " username
read -p "Gib den Ordnerpfad auf dem Raspberry Pi ein: " directory

# Kopiere die Template-Datei und ersetze die Platzhalter
cp sync-to-pi_template.sh sync-to-pi.sh
sed -i "s/{{IP_ADDRESS}}/$ip_address/g" sync-to-pi.sh
sed -i "s/{{USER}}/$username/g" sync-to-pi.sh
sed -i "s|{{DIRECTORY}}|$directory|g" sync-to-pi.sh

# Setze die Rechte der neuen Datei auf ausführbar
chmod +x sync-to-pi.sh

echo "Platzhalter wurden erfolgreich ersetzt und das Script wurde in 'sync-to-pi.sh' kopiert!"
