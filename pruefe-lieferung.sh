#!/bin/bash
# Was ausgeliefert wird, wird aus der Datei gelesen, nicht aus dem Gedächtnis.
# Der Anlass: Eine von Hand geschriebene Aufstellung vergaß die vier
# Schriftdateien; live lief Umbra in Systemschrift mit vier 404ern.
cd "$(dirname "$0")" || exit 1
START=umbra.html
verweise=$(grep -oE "(schrift|modelle)/[A-Za-z0-9._-]+" "$START" | sort -u)
# Die Darstellungen des Startpakets stehen nicht in der HTML, sondern in
# `STARTPAKET_DATEIEN` — sie werden erst auf Verlangen geholt und wären einem
# Verweis-Grep sonst entgangen. Genau so sind schon einmal vier Schriftdateien
# durchgefallen.
paket=$(sed -n '/const STARTPAKET_DATEIEN = \[/,/\];/p' "$START" | grep -oE "'[^']+'" | tr -d "'" | sed 's|^|modelle/|')
verweise=$(printf '%s\n%s\n' "$verweise" "$paket" | sort -u | grep -v '^$')
fehlend=0
for f in $verweise; do [ -f "$f" ] || { echo "FEHLT: $f"; fehlend=1; }; done
echo "# Auslieferung — $START und alles, worauf es verweist"
# Der Zeitpunkt, ab dem dieser Zustand gilt. Die Website-Session misst daran,
# ob eine Bildschirmaufnahme den aktuellen Stand zeigt — das ist verlässlicher,
# als zwei Bilder zu vergleichen und auf Unterschiede zu hoffen.
#
# Gilt für die **neueste** aller ausgelieferten Dateien, nicht für umbra.html
# allein. Am 16.09.2026 kam ein neu geschnürtes Nolli-Paket herein: Vertrag und
# drei Texturen wurden ausgetauscht, das Bild änderte sich sichtbar — und diese
# Zeile blieb stehen, weil die HTML unberührt war. Eine Aufnahme hätte damit
# als aktuell gegolten, die einen anderen Boden zeigte. Der Name dahinter sagt,
# was sich zuletzt bewegt hat; ohne ihn wäre ein Sprung nicht zuzuordnen.
# $START gehört dazu und steht **nicht** in $verweise — die Liste entsteht ja
# aus den Verweisen *innerhalb* der Datei. Ohne das ausdrückliche Mitnehmen
# übersprang die Suche ausgerechnet die Datei, die sich am häufigsten ändert;
# aufgefallen ist es erst, als eine Paketdatei nicht mehr die jüngste war.
neuste=$(ls -t "$START" $verweise 2>/dev/null | head -1)
echo "# Stand gilt ab: $(date -r "$neuste" '+%d.%m.%Y %H:%M')  (jüngste: $neuste)"
# Was das Werkzeug kann, aus der Datei gelesen. Zweimal ist ein Bild auf der
# Website mit dem Werkzeug auseinandergelaufen — einmal voraus (eine
# Darstellung, die es noch nicht gab), einmal hinterher (ein Blatt, das es
# nicht mehr gab). Wer die Lieferung meldet, meldet damit auch, woraus das
# Werkzeug besteht, und ein Widerspruch zur Seite fällt beim Lesen auf.
# paste -sd nimmt die Zeichen einzeln und wechselt sie durch, nicht als Kette:
# Deshalb erst mit einem Zeichen verbinden, dann ersetzen.
# Getrennt wird mit senkrechtem Strich, nicht mit Mittelpunkt: Seit ein Blatt
# „Sonnenstand · Tag" heißt, wäre eine Aufzählung mit Mittelpunkten nicht mehr
# zu lesen — man sähe sieben Namen statt fünf.
# Die Blattnamen stehen seit der Zweisprachigkeit (14.10.2026) im deutschen
# Wörterbuch, je Blatt als erste Zeile `    name: '…',`.
BLAETTER=$(sed -n '/^const de = {/,/^const en = {/p' "$START" | grep -oE "^    name: '[^']*'," | sed "s/^    name: '//; s/',$//" | paste -sd'~' - | sed 's/~/ | /g')
echo "# Blätter: ${BLAETTER:-nicht erkannt}"
echo
md5sum "$START" $verweise
echo
echo "# Vorhanden, aber unbenutzt (nicht hochladen):"
# Rekursiv, nicht nur eine Ebene: Ein Unterordner, der nur als Name in der
# Liste steht, verrät nicht, was darin liegt — und genau das wandert bei einem
# unachtsamen Ordnerabgleich mit auf den Server.
for f in $(find modelle schrift -type f | sort); do
  echo "$verweise" | grep -qx "$f" || echo "  $f"
done
[ $fehlend -eq 1 ] && { echo; echo "ABBRUCH: verwiesene Datei fehlt"; exit 1; }
exit 0
