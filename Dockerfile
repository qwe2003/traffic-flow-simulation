# Verwende ein Node.js-Image für ARM-Architektur
FROM node:16

# Erstelle ein Arbeitsverzeichnis
WORKDIR /usr/src/app

# Kopiere die package.json und installiere Abhängigkeiten
COPY package*.json ./
RUN npm install

# Kopiere den gesamten App-Code
COPY . .

# Öffne Port 3000
EXPOSE 3000

# Startbefehl
CMD ["npm", "start"]