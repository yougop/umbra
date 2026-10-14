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

HIER=$(md5sum umbra.html | cut -d' ' -f1)
printf 'hier            %s  %s B\n' "${HIER:0:12}" "$(wc -c < umbra.html)"

# **Jede Kompression einzeln.** Der CDN des Hosters hält je Accept-Encoding eine
# eigene Fassung. Am 14.10.2026 bekam curl ohne Kompression schon den neuen
# Stand, ein Browser (br) noch den alten – „GLEICH" war richtig gemessen und
# trotzdem falsch, weil es nicht das maß, was Besucher bekommen.
ALLE=0
for KODIERUNG in identity gzip br "gzip, deflate, br, zstd"; do
  curl -s --compressed -H "Accept-Encoding: $KODIERUNG" -o "$TMP" --max-time 30 "$ADRESSE" || { echo "NICHT ERREICHBAR  [$KODIERUNG]"; exit 2; }
  LIVE=$(md5sum "$TMP" | cut -d' ' -f1)
  printf 'online %-8s %s  %s B\n' "${KODIERUNG%%,*}$([ "${KODIERUNG#*,}" != "$KODIERUNG" ] && echo '+')" "${LIVE:0:12}" "$(wc -c < "$TMP")"
  [ "$LIVE" = "$HIER" ] || ALLE=1
done
if [ "$ALLE" = 0 ]; then echo 'GLEICH — jede Kompressionsfassung liefert diesen Stand.'; exit 0
else echo 'VERSCHIEDEN — mindestens eine Fassung liefert einen anderen Stand.'; exit 1; fi
