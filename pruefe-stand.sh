#!/bin/bash
# Was online liegt, wird abgerufen und nicht erinnert.
#
# Der Anlass: Ich habe am 16.09.2026 einen halben Tag lang gemeldet „online ist
# der alte Stand" — aus dem Gedächtnis, in jeder Nachricht wiederholt. Es
# stimmte, gewusst habe ich es nicht.
#
# Das ist **keine** Live-Prüfung. Ob das Ausgelieferte taugt, fragt
# `werkzeug/pruefe-live-umbra.mjs` beim Werkzeugkasten der Website-Sitzung, und
# dort gehört es hin. Hier steht nur die eine Frage, die ich für meine eigenen
# Meldungen beantworten muss: Ist das, was dort liegt, dieses hier?
cd "$(dirname "$0")" || exit 1
ADRESSE=${1:-https://zinssmeister.info/app/umbra/}
TMP=$(mktemp); trap 'rm -f "$TMP"' EXIT

# Drei Fehlerausgänge, getrennt gehalten — von der Nolli-Sitzung übernommen.
# Der dritte ist der gefährliche: Eine Fehlerseite mit Status 200 sieht sonst
# aus wie ein Ergebnis. Genau diese Sorte hat mich heute schon zweimal
# erwischt (0 gemessene Kronen, 131 von 229 Flecken) — die Zahl ist da, sie
# beschreibt nur etwas anderes als gedacht.
CODE=$(curl -s -o "$TMP" -w '%{http_code}' --max-time 30 "$ADRESSE") || {
  echo "NICHT ERREICHBAR  $ADRESSE"; exit 2; }
[ "$CODE" = 200 ] || { echo "STATUS $CODE  $ADRESSE"; exit 3; }
grep -q '<title>Umbra</title>' "$TMP" || {
  echo "KEIN UMBRA  Status 200, aber die Antwort ist nicht das Werkzeug"
  echo "            Titel: $(grep -oE '<title>[^<]*</title>' "$TMP" | head -1)"
  exit 4; }

LIVE=$(md5sum "$TMP" | cut -d' ' -f1)
HIER=$(md5sum umbra.html | cut -d' ' -f1)
printf 'online  %s  %s B\n' "${LIVE:0:12}" "$(wc -c < "$TMP")"
printf 'hier    %s  %s B\n' "${HIER:0:12}" "$(wc -c < umbra.html)"
if [ "$LIVE" = "$HIER" ]; then echo 'GLEICH — der ausgelieferte Stand ist dieser.'; exit 0
else echo 'VERSCHIEDEN — online liegt ein anderer Stand.'; exit 1; fi
