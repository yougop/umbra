---
name: Umbra
description: Nollis Grauleiter in zwei Schemata — ein helles Zeichenfeld in beiden, ein Schattenblau als einziger Akzent, und eine Bernsteinrampe, die die Oberfläche nie betritt.
colors:
  grund: "#fafafa"
  blatt: "#ffffff"
  senke: "#f2f2f2"
  linie: "#e6e6e6"
  linie-stark: "#cfcfcf"
  tinte: "#111111"
  tinte-2: "#616161"
  tinte-3: "#6d6d6d"
  akzent: "#3d6fa8"
  akzent-tief: "#2c5480"
  akzent-flor: "rgba(61,111,168,.14)"
  warn: "#8a4b12"
  warn-flor: "rgba(138,75,18,.10)"
  mess-0: "#fbf3e2"
  mess-1: "#f0d79b"
  mess-2: "#dfae55"
  mess-3: "#b87a21"
  mess-4: "#7a4409"
  himmel-hoch: "#ecebe5"
  himmel-flach: "#e7ddcd"
  himmel-nacht: "#d7dade"
  masse-bestand: "#edece7"
  masse-entwurf: "#ffffff"
typography:
  display:
    fontFamily: "'JetBrains Mono', ui-monospace, monospace"
    fontSize: "19px"
    fontWeight: 500
    lineHeight: 1.35
    letterSpacing: "-0.02em"
    fontFeature: "tabular-nums"
  headline:
    fontFamily: "Satoshi, ui-sans-serif, system-ui, -apple-system, 'Segoe UI', sans-serif"
    fontSize: "15px"
    fontWeight: 700
    lineHeight: 1.5
    letterSpacing: "-0.03em"
  title:
    fontFamily: "Satoshi, ui-sans-serif, system-ui, -apple-system, 'Segoe UI', sans-serif"
    fontSize: "13px"
    fontWeight: 500
    lineHeight: 1.5
  body:
    fontFamily: "Satoshi, ui-sans-serif, system-ui, -apple-system, 'Segoe UI', sans-serif"
    fontSize: "13.5px"
    fontWeight: 400
    lineHeight: 1.5
  prose:
    fontFamily: "Satoshi, ui-sans-serif, system-ui, -apple-system, 'Segoe UI', sans-serif"
    fontSize: "12px"
    fontWeight: 400
    lineHeight: 1.45
  label:
    fontFamily: "Satoshi, ui-sans-serif, system-ui, -apple-system, 'Segoe UI', sans-serif"
    fontSize: "11px"
    fontWeight: 500
    letterSpacing: "0.11em"
  data:
    fontFamily: "'JetBrains Mono', ui-monospace, monospace"
    fontSize: "12px"
    fontWeight: 400
    letterSpacing: "-0.01em"
    fontFeature: "tabular-nums"
rounded:
  klein: "2px"
  rund: "4px"
spacing:
  haar: "2px"
  eng: "4px"
  reihe: "6px"
  naht: "9px"
  block: "12px"
  teil: "16px"
  rand: "18px"
  buehne: "28px"
components:
  knopf:
    backgroundColor: "{colors.grund}"
    textColor: "{colors.tinte-2}"
    typography: "{typography.body}"
    rounded: "{rounded.rund}"
    padding: "7px 9px"
  knopf-gedrueckt:
    backgroundColor: "{colors.tinte}"
    textColor: "{colors.blatt}"
    rounded: "{rounded.rund}"
    padding: "7px 9px"
  hauptaktion:
    backgroundColor: "{colors.tinte}"
    textColor: "{colors.blatt}"
    rounded: "{rounded.rund}"
    padding: "11px 14px"
    width: "100%"
  blatt-knopf:
    backgroundColor: "transparent"
    textColor: "{colors.tinte-2}"
    rounded: "{rounded.rund}"
    padding: "7px 9px"
  blatt-knopf-aktiv:
    backgroundColor: "{colors.senke}"
    textColor: "{colors.tinte}"
    rounded: "{rounded.rund}"
    padding: "7px 9px"
  feld:
    backgroundColor: "{colors.grund}"
    textColor: "{colors.tinte}"
    rounded: "{rounded.rund}"
    padding: "8px 10px"
    width: "100%"
  urteil:
    backgroundColor: "{colors.grund}"
    textColor: "{colors.tinte-2}"
    typography: "{typography.prose}"
    rounded: "{rounded.rund}"
    padding: "9px 11px"
  urteil-mahnt:
    backgroundColor: "{colors.warn-flor}"
    textColor: "{colors.warn}"
    rounded: "{rounded.rund}"
    padding: "9px 11px"
  zeichenfeld:
    backgroundColor: "{colors.blatt}"
    textColor: "{colors.tinte}"
    rounded: "0"
---

# Design System: Umbra

## Overview

**Creative North Star: „Das Nachweisblatt"**

Umbra ist kein Viewer mit Bedienrand, sondern ein technisches Blatt, auf dem gerechnet wird. Die Oberfläche verhält sich wie ein Zeichnungsträger: ein weißes Feld in der Mitte, Haarlinien als einziges Trennmittel, Werte am Rand in Maschinenschrift, unten eine durchlaufende Spur mit dem Rechenstand. Nichts glänzt, nichts schwebt, nichts ist transparent. Die Szene ist der Gegenstand; alles andere ist Beschriftung.

Das System ist **geerbt, nicht erfunden**. Umbra ist das Geschwister von Nolli und übernimmt dessen „Stifttabelle" (`https://github.com/yougop/nolli/blob/main/DESIGN.md`): dieselbe Grauleiter, dieselben zwei Schnitte, dieselbe Haarliniendisziplin, derselbe 4-px-Radius. Eigen ist nur, was Umbra zusätzlich braucht: ein zweites Schema für dunkle Umgebungen, ein eigener Akzent (Schattenblau), und eine deklarierte Messrampe für Auswertungsflächen. Wo eine Entscheidung bei Nolli schon gefallen ist, wird sie hier nicht neu getroffen.

Verweigert wird ausdrücklich die dunkle Bühne mit schwebenden Glaspanels und Neonakzent — die übliche Optik für 3D-Werkzeuge im Browser. Umbra ist dichter als eine Marketingseite und ruhiger als ein CAD-Panel: Die Fläche trägt viel, aber jede Zahl steht an einer Kante, nicht in einer Karte.

**Key Characteristics:**
- Vierzeiliges Vollhöhen-Raster: Kopf · Fläche · Maßkette · Statuszeile, kein Scroll auf dem Dokument
- Haarlinie 1 px als einziges Trennmittel; Flächen statt Karten, Radius 4 px
- Zwei Schemata aus einer Tokenliste — das Zeichenfeld bleibt in beiden hell
- Satoshi spricht, JetBrains Mono misst, `tabular-nums` an jeder Messstelle
- Ein Akzent für Zustand und Sonne; die Messrampe ist eine getrennte Sprache
- Notebook zuerst: jede Layoutentscheidung ist bei 1280×720 geprüft

## Colors

Eine dreistufige Tintenleiter auf einer vierstufigen Papierleiter, ein einziger Akzent, eine gedämpfte Warnfarbe — und daneben, streng getrennt, eine Bernsteinrampe, die nur auf Auswertungsflächen erscheint.

### Primary
- **Schattenblau** (`--akzent`, hell #3d6fa8 / dunkel #79a6dd): der eine Akzent. Er trägt vier Dinge und sonst nichts: die Sonne und ihre Bahnen in der Szene, die Ziffer des aktiven Blattes, die Auswahl (`::selection`, Reglerring, Checkbox), und die Füllung des Fortschrittsbalkens in der Hauptaktion.
- **Schattenblau tief** (`--akzent-tief`, hell #2c5480 / dunkel #9cc1ec): Fokusring (`2px` Kontur, `2px` Versatz) und `accent-color` der Checkboxen. Im dunklen Schema ist „tief" heller als der Akzent — die Rolle ist Kontrast, nicht Dunkelheit.
- **Schattenblau-Flor** (`--akzent-flor`): flächiger Niederschlag desselben Blaus bei ~14 % (dunkel 20 %) für Textauswahl und den Hof unter dem Reglerknopf.

### Secondary
- **Rostbraun** (`--warn`, hell #8a4b12 / dunkel #d3924f): die einzige zweite Stimme. Sie markiert einen veralteten Rechenstand, einen unterschrittenen Nachweiswert (zusätzlich durchgestrichen) und den mahnenden Urteilskasten. Kein Rot; ein Nachweis, der nicht hält, ist ein Befund, kein Alarm.

### Tertiary
- **Die Messrampe** (`--mess-0` #fbf3e2 → `--mess-4` #7a4409): fünf Stufen einer Farbe, hell nach dunkel — mehr Sonne, mehr Tinte. Sie färbt Dreiecke im Modell, die Rampenleiste und die Klassenproben. Daneben stehen benannt zwei Alternativrampen (*Ladybug* für den Vergleich mit Rhino, *Grauwert* für den Druck); die Wahl ist eine Auswertungsentscheidung, keine Gestaltungsfreiheit.
- **Himmel und Massen** (`--himmel-hoch` #ecebe5, `--himmel-flach` #e7ddcd, `--himmel-nacht` #d7dade; Bestand #edece7, Entwurf #ffffff): die Szenenfarben. Der Grund folgt dem Sonnenstand — bei hoher Sonne blattnah, bei flacher wärmer, unter dem Horizont kühl gedämpft. Nie so hell, dass der Schlagschatten verschwindet, nie so dunkel, dass das Modell zur Silhouette wird.

### Neutral
- **Papier** (`--blatt` #ffffff / dunkel #1b1e20): das Erhobene. Kopf, Register, Schiene, Maßkette, Statuszeile und das Zeichenfeld selbst.
- **Grund** (`--grund` #fafafa / dunkel #131517): der Untergrund. Eingabefelder, ruhende Knöpfe, der Urteilskasten, das Ladeblatt.
- **Senke** (`--senke` #f2f2f2 / dunkel #0c0e0f): das Eingelassene. Die Bühne, auf der das Zeichenfeld liegt, und der Rücken des aktiven Blattknopfes.
- **Haarlinie** (`--linie` #e6e6e6 / dunkel #2a2e31): jede Trennung im Blatt. Es gibt kein zweites Trennmittel.
- **Haarlinie stark** (`--linie-stark` #cfcfcf / dunkel #454a4e): Umriss, der etwas Bedienbares meint — Reglerschiene, Blattziffer, Rollbalken, Umriss bei Hover.
- **Tinte** (`--tinte` #111111 / dunkel #f0f1ef): Messwerte, aktive Zustände, die Hauptaktion als Fläche.
- **Tinte 2** (`--tinte-2` #616161 / dunkel #a9aeb2): Beschriftungen, Fließtext, ruhende Bedienelemente.
- **Tinte 3** (`--tinte-3` #6d6d6d / dunkel #838a8f): das Leiseste — Herkunftszeilen, Sollwerte, Achsenbeschriftung, Platzhalter.

**Das Baumgrün** `--baum` (#4F7F4A hell, #6EA368 dunkel) ist **kein zweiter Akzent**. Der Akzent gehört der Sonne und markiert Bedienzustände; dieses Grün kommt nur im Modell vor und in dem einen 9-px-Punkt am Baumschalter, der sagt, was im Modell steht. Gesetzt auf Nutzerentscheidung vom 16.09.2026: grün und undurchsichtig.

### Named Rules

**Die AA-Boden-Regel.** `--tinte-3` ist die unterste Stufe und trägt an siebzehn Stellen den kleinsten Grad. Ihr Wert ist gegen den Boden gerechnet, auf dem sie steht: hell #6d6d6d = 4,62 : 1 auf `--senke` (#737373 ergab nur 4,24 : 1), dunkel #838a8f = 4,79 : 1 auf `--blatt` (#7c8287 ergab nur 4,31 : 1). Diese Stufe wird nie „zurück auf ein schöneres Grau" gesetzt. Wer sie anfasst, rechnet zuerst gegen `--senke` und `--blatt` nach.

**Die Ein-Akzent-Regel.** Es gibt genau einen Akzent. Sonne, aktives Blatt, Auswahl, Ring — mehr Rollen bekommt er nicht, und keine andere Farbe übernimmt eine davon. Eine zweite Akzentfarbe „für Abwechslung" ist ein Systembruch.

**Die Trennungsregel.** Die Messrampe ist Datensprache und erscheint nie als Oberflächenfarbe: kein bernsteinfarbener Knopf, kein bernsteinfarbener Rahmen, keine bernsteinfarbene Überschrift. Umgekehrt färbt der Akzent nie Messwerte ein. Wer beides mischt, macht eine Skala zur Dekoration.

**Die Abwesenheitsregel.** Nur Dunkel wird markiert (`:root[data-schema="dunkel"]`). Hell ist die Abwesenheit des Attributs, nicht ein zweiter benannter Zustand. Beide Schemata kommen aus derselben Tokenliste; es kehrt sich die Leiter um, die Rollen bleiben.

**Die Gegenstandsregel.** Was auf dem Modell liegt, behält seine Farbe; was in der Luft davor steht, folgt dem Schema. Das Weißmodell (`bestand` #edece7, `entwurf` #ffffff) und die Objektkanten (#111111) sind schemafest, weil das Modell der Gegenstand ist und weiß bleibt. Der Hintergrund dagegen ist Oberfläche und nimmt `--grund` an — zur Laufzeit aus dem Schema gelesen (`schemaFarbe()`), nicht nachgebaut, damit er nicht neben der Oberfläche herläuft. Ebenso schemagebunden: Tagesbahnen (`--tinte` / `--tinte-2` / `--tinte-3`), Analemmen und Stundenmarken (`--akzent`), Horizontkreis (`--linie-stark`), Sonnenmarke (`--tinte`). Sie stehen alle vor dem Hintergrund und müssten sonst in einem der beiden Schemata verschwinden.

*Vorgeschichte, damit sie nicht zurückkommt:* Bis dahin führte das Zeichenfeld eine eigene helle Leiter und blieb in beiden Schemata hell, und der Hintergrund folgte dem Sonnenstand — bei flacher Sonne warm (#e7ddcd). Beides ist auf Nutzerentscheidung entfallen: Der Grund soll die Farbe der Oberfläche tragen, nicht die der Tageszeit. Der Schattenwurf bleibt trotzdem lesbar, weil er auf die Bodenplatte und die Aufsicht fällt, und die sind hell.

## Typography

**Display / Mess-Schrift:** JetBrains Mono (mit `ui-monospace, monospace`), Schnitte 400–500, lokal als woff2
**Sprech-Schrift:** Satoshi (mit `ui-sans-serif, system-ui, -apple-system, 'Segoe UI', sans-serif`), Schnitte 400 / 500 / 700, lokal als woff2

**Character:** Dieselbe Paarung wie bei Nolli. Satoshi ist eine ruhige, leicht geometrische Grotesk ohne Eigenwilligkeit — sie erklärt und stellt sich nicht in den Weg. JetBrains Mono trägt jede Zahl: gleiche Ziffernbreite, klare Null, und damit eine Spalte, die beim Ziehen des Zeitreglers nicht zappelt. Die Basis ist 13,5 px bei 1,5 Zeilenhöhe.

### Hierarchy
- **Display** (JetBrains Mono 500, 19 px, 1,35, −0,02 em, `tabular-nums`): der eine Hauptmesswert eines Teils (`.wertzeile.haupt dd`) — Sonnenhöhe, Ø-Ertrag je m² Dach. Höchstens einer pro Teil.
- **Headline** (Satoshi 700, 15 px, −0,03 em): Wortmarke und Ladeblattmarke. Sonst nichts.
- **Title** (Satoshi 500, 13 px): Blattnamen im Register, Zeilen mit Schaltcharakter.
- **Body** (Satoshi 400, 13,5 px, 1,5): Grundschrift; Bedienzeilen und Hauptaktion liegen bei 12,5–13,5 px.
- **Prose** (Satoshi 400, 12 px, 1,45, `--tinte-2`): erklärende Sätze, Urteilskasten, Wertbeschriftungen.
- **Label** (Satoshi 500, 11 px, +0,11 em, Versalien, `--tinte-2`): Teilüberschriften in Schiene und Register. Der einzige Ort für Versalien.
- **Data** (JetBrains Mono 400, 12 px, −0,01 em, `tabular-nums`): laufende Messwerte, Statuszeile, Achsen der Maßkette, Herkunftszeilen. Einzelwerte in der Wertliste stehen bei 13 px / 500.

### Named Rules

**Die Zwei-Stimmen-Regel.** Satoshi spricht, JetBrains Mono misst. Alles, was eine Größe, eine Zeit, eine Koordinate, einen Anteil oder einen Rechenstand trägt, steht in Mono — und trägt `font-variant-numeric:tabular-nums`, ausnahmslos, auch in SVG-Text. Alles, was erklärt, benennt oder auffordert, steht in Satoshi. Eine Zahl in Satoshi ist ein Fehler, ein Satz in Mono auch.

**Die Schriftbodenregel.** 11 px ist der Boden für Bedientext (Label, Statuszeile, Achsen, Sollwerte), 12 px der Boden für Fließtext und Daten. Der Vorgänger arbeitete mit 9–11 px; das war zu klein und ist ausdrücklich zurückgenommen. Unter 11 px geht nichts, auch nicht „nur für diese eine Zeile".

**Die Einheitenregel.** Die Einheit gehört zur Zahl, steht aber leiser: `.einheit` läuft 11 px / 400 in `--tinte-2` (bei Hauptwerten 12 px). Sonst wiegt „kWh/m²a" optisch schwerer als der Messwert davor.

## Layout

**Das Blatt.** `#app` ist ein Raster über die volle Höhe (`100dvh`) mit vier Zeilen fester Ordnung: Kopf (`--kopf-h` 52 px) · Fläche (`minmax(0,1fr)`) · Maßkette (`--mass-h` 58 px) · Statuszeile (`--fuss-h` 32 px). Das Dokument selbst scrollt nie (`body { overflow:hidden }`); gescrollt wird nur innerhalb von Register und Schiene.

**Die Fläche** ist dreispaltig: Register (`--register-w` 248 px) · Bühne (`minmax(0,1fr)`) · Schiene (`--schiene-w` 324 px). Links die Werkbankseite — womit gearbeitet wird; rechts die Auswertung — was gerade gerechnet wird; dazwischen die Bühne.

**Die Bühne** ist eine Spalte (`flex-direction:column`, Polster `--rand`, Abstand `--reihe`) aus zwei Teilen: der Darstellungsleiste und dem Feld. Das Feld (`.buehne-feld`) nimmt mit `flex:1; min-height:0` den Rest; das Zeichenfeld sitzt absolut darin (`inset:0`). Die Leiste steht **über** dem Feld, nicht darin — eine Leiste im Bild verdeckt das, was sie beschreibt.

**Rhythmus.** Eine benannte Leiter statt einer 8-px-Skala: `--haar` 2 · `--eng` 4 · `--reihe` 6 · `--naht` 9 · `--block` 12 · `--teil` 16 · `--rand` 18 · `--buehne` 28. Teile in der Schiene bekommen `--teil` oben/unten und `--rand` seitlich; Kinder eines Teils stehen mit `--block` auseinander (`.teil > * + *`); Zeilen innerhalb einer Liste mit 5–6 px und einer Haarlinie dazwischen.

**Responsives Verhalten** verkleinert zuerst die Ränder, dann die Spalten, dann die Struktur:
- ≤1500 px: Schiene 300, Register 226
- ≤1340 px: Schiene 284, Register 210, `--rand` 12
- ≤1100 px: Register 196 (Blattnamen bleiben — das ist die Notebookgröße)
- ≤1040 px: Schiene bricht unter die Bühne, gedeckelt auf `44vh` mit eigenem Bildlauf; Kopfwerte entfallen
- ≤720 px: Register wird zur Ziffernzeile über der Bühne (nur das aktive Blatt behält seinen Namen), Maßkette bekommt volle Breite auf zwei Zeilen (`--mass-h` 96); Schiene auf `40vh` gedeckelt; die Darstellungsleiste wird zur einzeiligen Laufleiste
- Höhe ≤820 px: Maßkette 52, Kopf 48, Teilpolster auf `--block`/`--teil`
- Höhe ≤700 px: Maßkette 46, Fuß 28, `--rand` 10

### Named Rules

**Die Pufferregel.** Die Leinwand bekommt ihre Anzeigegröße aus dem Stil (`#szene canvas { width:100%; height:100% }`), niemals aus ihren Attributen. Fehlt diese Regel, wird sie in Attributgröße angezeigt; ist der Puffer dann größer als das Feld, schneidet `overflow:hidden` den Überstand weg — das Fenster zeigt **weniger**, als der Puffer enthält, und eine Ausgabe aus dem Puffer bringt unten und rechts Bild mit, das nie zu sehen war. Genau so ist es aufgetreten.

Dazu muss der Puffer auf sein Sollmaß gezogen werden, und zwar bei **beiden** Anlässen: geändertes Feld *und* abgekommener Puffer. Verglichen wird gegen `Math.floor(feld * renderer.getPixelRatio())` — ein Vergleich gegen die Feldbreite allein schlägt bei jedem Pixelverhältnis ungleich 1 dauerhaft fehl und läuft in jedem Bild neu, ohne je anzukommen. Die Bildschleife prüft alle 120 ms, jede Ausgabe zieht vorher nach.

Nachgewiesen gegen einen absichtlich auf 1157 × 777 verstellten Puffer bei einem Feld von 1310 × 962: Ohne Regel kam die Ausgabe mit 1157 × 847 heraus und wich um 93 von 255 vom Fenster ab; mit Regel mit 1310 × 1040 und 0,05 von 255.

**Die Blattregel (Ausgabe).** Das ausgegebene Bild ist **genau der Ausschnitt des Fensters** plus Fußleiste — die Zeichnung ist pixelgleich mit dem, was im Zeichenfeld steht (nachgemessen: mittlere Abweichung 0,09 von 255), und sie füllt über 90 % des Bildes. Nichts wird danebengestellt. Eine Wertespalte rechts war einmal da und ist entfallen: Sie machte das Bild um ein Drittel breiter, blieb auf den Blättern ohne Rechnung leer, und die Zeichnung schrumpfte gegenüber der Ansicht, ohne dass etwas hinzukam. Was ein Blatt zum Lesen braucht, steht in der Legende; alles Weitere ist Verlauf der Rechnung und gehört nicht auf das Blatt.

**Die Legendenregel.** Ein ausgegebenes Blatt bringt mit, was zu seinem Lesen nötig ist. Jedes Blatt liefert dafür `legende()` — eine Reihe Farbproben oder die Messrampe mit ihren Enden —, und die Ausgabe setzt sie über die Herkunftszeile. Ohne Legende bleibt die Fußleiste einzeilig. Grund: Die Zeichenerklärung steht in der Oberfläche neben dem Blatt; sobald das Bild die Oberfläche verlässt, muss sie mitreisen, sonst ist eine eingefärbte Fläche eine Behauptung ohne Skala.

**Die Namensregel.** Ein Klassenname wird nicht ein zweites Mal vergeben. `.reihe` war die absolut positionierte Vierer-Reihe im Zeichenfeld; als zweite Bedeutung für „zwei Knöpfe nebeneinander" gab sie ihren Knöpfen `position:absolute` mit, und die schwammen über die halbe Schiene. Für ein Raster im Fluss heißt es `.knopfreihe`.

**Die Umbruchregel.** Eine Wertzeile bricht um, statt zu quetschen. `.wertzeile` und `.teil-kopf` stehen auf `display:flex; flex-wrap:wrap; align-items:baseline; gap:2px var(--naht)`, der Wert holt sich seinen Platz mit `margin-left:auto` — **nie** über `justify-content:space-between`. Grund, dreimal aufgetreten: Ein `white-space:nowrap`-Wert neben `space-between` drückt die Beschriftung auf Nullbreite, sie bricht dann unter den Wert und überschreibt ihn. Die Beschriftung darf schrumpfen, der Messwert nie: `dt` bekommt `min-width:0`, `dd` behält `white-space:nowrap`. Auf einer 284-px-Schiene ist eine zweite Zeile richtig und ein abgeschnittener Stand falsch.

**Die Notebookregel.** Jede Layoutentscheidung wird bei 1280×720 geprüft, nicht bei 2560×1440. Wenn etwas dort nicht passt, schrumpft der Rand, nicht die Schrift (siehe Schriftbodenregel).

**Die Feldwahlregel.** Was das Bild wechselt, steht über dem Bild, nicht in der Schiene. Die Darstellungsleiste ist ein segmentierter Umschalter in Nollis Bauform (geteilte Ränder statt Abstände, Satoshi 500 / 12 px, die gewählte Fassung dunkel gefüllt) und erscheint erst ab zwei Darstellungen — ein Umschalter mit einem Eintrag ist Zierrat. Im engen Fenster läuft sie waagerecht statt umzubrechen: Umgebrochen belegte sie zwei Zeilen und ließ von einer 221 px hohen Bühne 109 für das Bild; einzeilig bleiben 163. Dann muss die **gewählte** Fassung eingescrollt werden (`scrollLeft` beim Zeichnen) — eine Leiste, die eine Auswahl anzeigt, die außerhalb des Sichtbaren liegt, ist keine. Der halb abgeschnittene Nachbarknopf ist der Hinweis, dass es weitergeht; eine Ausblendkante wäre hier eine Lüge, sobald ans Ende gescrollt ist.

**Die Schwereregel.** Neben der Darstellungsleiste steht nur, was etwas verlangt. Genau ein Fall steht dort: die Fassung mit eingebranntem Schatten, in `--warn` / 500 — man kann ihn für den gerechneten halten und liest dann eine Verschattung, die niemand gerechnet hat. Eine leise zweite Stufe für den mitgezeichneten Grundriss stand hier einmal daneben und ist entfallen: Ein Satz, der bei jeder zweiten Fassung dasteht und nichts verlangt, ist Tapete und nimmt der Warnung die Wirkung mit. Wo zwei Stufen nötig scheinen, ist meist die leisere überflüssig.

**Die Unterschiedsregel.** Eine Beschriftung nennt den Unterschied zu dem, was danebensteht, nicht die Herkunft des Dings. Die Bodenfassung heißt „Aufsicht"; „ohne Bauten" kommt nur dazu, wenn die Fassung *mit* Bauten im selben Paket wirklich vorliegt. Maßgeblich ist das Geladene, nicht das Angekündigte — das Startpaket führt den Vertrag des vollen Nolli-Pakets und liefert nur einen Teil der Bilder; gegen die Vertragsliste geprüft hieße der einzige Knopf „Aufsicht ohne Bauten", im Gegensatz zu nichts.

**Die Zutatregel.** Was zu einer Wahl hinzutritt, bekommt einen eigenen Knopf neben der Gruppe, kein weiteres Segment darin. Ein Segment verspricht, dass es die anderen ablöst. Die Bäume treten zu jeder Darstellung hinzu — also `.feldwahl-zusatz`, eigener Rahmen, eigener Radius, mit einem 9-px-Punkt, der eingeschaltet die Farbe zeigt, die im Bild steht.

**Die Bildwahrheitsregel.** Steht im Bild ein Schatten, den keine Zahl daneben kennt, muss das dastehen — in `--warn`, solange der Zustand anhält. Zwei Fälle haben diese Form: die Darstellung mit eingebranntem Schatten und die zugeschalteten Baumkronen. Beide schreiben in denselben Platz neben der Leiste; treffen sie zusammen, stehen beide Sätze dort. Die Sätze bleiben kurz genug, dass die Leiste einzeilig bleibt (gemessen bei 1280: 28 px mit, 28 px ohne) — ein Vorbehalt, der das Zeichenfeld verkleinert, wird abgeschafft statt gelesen.

**Die Aufwandsregel.** Wo eine Vorgabe absichtlich teuer ist, steht unter dem Regler, was sie kostet — als Menge und als Vergleich mit dem letzten gemessenen Lauf, nie als Sekundenversprechen über fremde Hardware. Der Hinweis nennt den wirksamsten Hebel beim Namen (den Rechenausschnitt) und steht dort, wo man ihn bedient. Die zugrunde liegende Schätzung wird **gemessen kalibriert**, nicht hergeleitet: Die erste, aus der Dreiecksfläche hergeleitete Fassung lag zwölffach zu niedrig, und die Warnung blieb bei einem 82-Sekunden-Lauf aus.

**Die Mischungsregel.** Eine Auswertung über einem Bild darf multiplizierend gemischt werden, damit der Untergrund lesbar bleibt — dann gilt die Legende aber nicht mehr genau, denn die gezeigte Farbe ist das Produkt aus Rampe und Untergrund. Beides wird angeboten (*Multiplizierend* zum Verorten, *Deckend* zum Ablesen), der Unterschied steht am Umschalter, und **die ausgegebene Legende trägt den Vermerk mit**. Eine Rampe, die neben einer Fläche steht, deren Farben sie nicht mehr erklärt, wäre genau die Behauptung ohne Skala, die die Legendenregel verbietet.

**Die Ansichtsregel.** Die Ansicht steht als **Gruppe `2D | 3D`** in der Leiste, nicht als einzelner Schalter „Draufsicht". Ein einzelner Schalter sagt nur, wohin man geht, nicht, wo man ist: Ausgeschaltet stand dort ein Angebot und kein Zustand, und die Leiste daneben zeigte zur selben Zeit sehr wohl einen. **Zwei gleichrangige Zustände gehören in eine Gruppe**, in der immer einer gedrückt ist — dieselbe Bauform wie die Darstellungen daneben. Das Blatt heißt in Fußleiste und Dateiname weiterhin „Draufsicht": Der Knopf nennt den Zustand, die Ausgabe nennt die Art des Bildes, und das sind zwei verschiedene Auskünfte.

**Die Aufwandsregel, nachgemessen.** Die Hüllflächen sind mit Abstand das langsamste Blatt: *gemessen* 73 s gegen 12 s (Stadtraum) und 6 s (Windexposition), bei 530.082 Teildreiecken und elf Sonnenständen. Die Phasen einzeln: **Teilen 3,6 s · Strahlen 67,9 s · Auflage 0,3 s** — 95 % sind Strahlen.

**Zwei Griffe, ein Ergebnis, und eine widerlegte Vermutung.** Der Strahlenschnitt läuft jetzt unmittelbar über `boundsTree.raycastFirst` statt über `raycaster.intersectObject`: kein Ergebnisfeld, keine Objektraum-Rechnung, Halt beim ersten Treffer. Im Einzeltest **2,68-mal so schnell** (239.000 gegen 640.000 Strahlen je Sekunde), im ganzen Blatt aber nur **73 → 69 s**. Der Unterschied ist die Auskunft: **Die Zeit steckt in der Baumdurchquerung, nicht im Aufruf.** Echte Schattenstrahlen starten auf einer Fassade und streifen an ihr entlang, sie fragen den Baum tief. Ebenso widerlegt: Größere Blöcke zwischen den Atempausen (2.000 → 12.000) änderten nichts messbar.

**Was wirklich hülfe, wäre ein anderes Verfahren** — eine Schattenkarte je Sonnenstand auf der Grafikkarte statt Strahl für Strahl. Das ist ein eigener Bau mit eigenen Genauigkeitsfragen (Tiefenversatz, Auflösung) und keine Optimierung. Bis dahin sind die beiden Regler der Hebel: Kantenlänge und Zahl der Sonnenstände, beide mit Kostenschätzung daneben.

**Die Laufregel.** Beide Sonnenblätter haben einen Abspielknopf: **„Tag abspielen"** auf Blatt 1, **„Jahr abspielen"** auf Blatt 2. Es sind die zwei Achsen, auf denen die Sonne sich bewegt — dort wandert der Tag bei fester Uhrzeit, hier die Uhrzeit an einem festen Tag —, und dass eine davon keinen Knopf hatte, war eine Lücke und keine Entscheidung.

**Gelaufen wird von Aufgang bis Untergang, nicht von null bis vierundzwanzig.** Die Stunden davor und danach zeigen ein unverändertes Bild; ein Lauf, der ein Drittel seiner Zeit im Dunkeln steht, sieht aus, als hinge er. Das Tempo steht daneben (2 bis 30 Minuten je Bild, voreingestellt 10), und beim Blattwechsel hält der Lauf an — ein Blatt, das man verlassen hat, soll nicht weiterarbeiten.

**Die Bodensperre gilt auf allen drei rechnenden Blättern** — Hüllflächen, Stadtraum, Windexposition: erlaubt sind Schwarzplan und Linie, eröffnet wird mit dem Schwarzplan. Die Textur bringt eigene Farben mit, und unter der Messrampe entsteht aus beiden eine dritte, die keine von beiden erklärt.

**Die Fußleistenregel.** Die Fußleiste **wächst, sie streicht nicht.** Die Herkunftszeile trägt sechs Angaben — Ort, Zeitpunkt, Sonnenstand, Maßstab, Blatt, Werkzeug; bisher wich der **Sonnenstand**, wenn es eng wurde, „er stehe ohnehin im Blatt". *Gemessen* wurde es dadurch aber nicht im Ausnahmefall eng, sondern **immer**: Bedarf und Vorrat wachsen mit der Bildbreite gemeinsam, das Verhältnis bleibt, und bei 0,40 Grad braucht die Zeile bei *jeder* Breite 6 bis 20 % mehr Platz, als sie hat. Der Sonnenstand fiel also in jedem Bild weg — auf einem Sonnenblatt die falsche Angabe zum Weglassen.

**Zwei Grade, zwei Aufgaben.** Die Zeichenerklärung steht bei 0,40 der Zeilenhöhe: Sie wird gelesen, um das Bild zu verstehen. Die Herkunft steht bei 0,28: Sie ist das Kleingedruckte eines Schriftfelds und wird gelesen, um das Bild später zuzuordnen. Damit passt sie ab 868 px auf eine Zeile; darunter — und im Plan, wo „Draufsicht" dazukommt — nimmt die Leiste eine zweite Zeile, statt eine Angabe zu opfern.

**Die Probenregel.** Die Farbproben der Zeichenerklärung tragen die Farben, **die im Bild stehen** — nicht die, die sie einmal trugen. Auf Blatt 2 stand noch die Tintenleiter, während die drei Tagesbahnen längst blau sind: schwarze Kästchen unter blauen Bögen. **Eine Zeichenerklärung, die eine andere Farbe nennt als die Zeichnung, ist schlimmer als keine** — sie behauptet eine Zuordnung, die nicht gilt. Gefunden beim Durchsehen aller fünf Fußleisten, nicht beim Ändern der Bahnfarbe.

**Die Maßstabsregel (Ausgabe).** Was auf dem Bildschirm steht, steht in der Ausgabe **gleich groß im Verhältnis zum Bild**. Der Markerschild-Maßstab war `Ausgabebreite / 1200`, und 1200 war geraten: Für die gewöhnliche Ausgabe stimmte es zufällig, weil sie so breit ist wie das Feld. Die große Planausgabe rendert aber mit einem Puffer bis 6.000 Bildpunkte, und dann trug ein Schild *gemessen* 9,8 % der Bildbreite statt der 13,5 % vom Bildschirm — die Marker kamen zu klein heraus. Richtig ist das Verhältnis **Ausgabebreite zu Feldbreite**; dann sitzt ein Schild im Bild so groß wie im Werkzeug, bei jeder Puffergröße und auf jedem Bildschirm. *Gemessen*: Maßstab 1,00 (Raum) und 1,83 (Plan), in beiden Wegen derselbe Anteil.

**Das Maß kommt vom Schild selbst, nicht aus einer Nachrechnung.** Der richtige Maßstab genügte nämlich nicht: Die Kastenbreite wurde aus den Textbreiten neu gerechnet und fiel kleiner aus als das Schild im Werkzeug — *gemessen* **6,13 % gegen 8,82 %**, also 30 % zu klein, und zwar in beiden Ausgabewegen gleich. Der Maßstab war richtig, die Grundgröße nicht. Schuld waren Kleinigkeiten, die eine Nachrechnung nie alle einholt: der Sperrschritt der Beschriftung, das Polster für das Kreuz, die tatsächliche Schriftmetrik. **Die Marker werden nicht nachgebaut, sondern abgezeichnet.** Zweimal wurde hier nachgerechnet und zweimal lief es auseinander: erst die Größe (Kasten aus Textbreiten, *gemessen* 6,13 % gegen 8,82 % — 30 % zu klein), dann die Lage (eigene Ausweichrechnung, andere Reihenfolge, andere Stapelung; die Schilder saßen im Bild woanders als im Werkzeug). Beide Male war der Fehler derselbe: **eine zweite Herleitung derselben Sache.**

Die Schilder stehen im Baum, die Anschlusslinien im SVG, und beide kennen ihre Maße in Feldpunkten. Abgezeichnet wird also, was dasteht — Kasten, Linie, Punkt, Beschriftung, Grad —, umgerechnet mit einem einzigen Faktor: **Pufferpunkte je Feldpunkt**, `quelle.width / Feldbreite`. Nicht `aus.w / Feldbreite`: `aus` ist der Ausschnitt, den die Datei behält, der Puffer das Ganze. Im Plan ist der Ausschnitt kleiner als der Puffer, dort steht deshalb mehr Schild auf weniger Bild — richtig so, weil die Datei auch weniger Gebiet zeigt. *Gemessen nachher*: Größe 8,83 % gegen 8,82 %, Lage 49,05 % gegen 49,05 %.

**Und was die Vorlage verwandelt, verwandelt die Aufnahme auch.** `textContent` gibt den Rohtext; `text-transform` und `letter-spacing` stehen im Stil. Ohne sie stand im Bild „Windexposition“ und auf dem Schirm „WINDEXPOSITION“ — dieselbe Sorte Abweichung wie bei Größe und Lage, nur in der Schrift. Das Kreuz bleibt draußen: Es ist ein Bedienteil, kein Bestandteil.

**Die Fußzeile ist anderthalbmal so groß.** Sie trug bei 2.402 Bildpunkten Bildbreite 24 Bildpunkte Schrift — ein Prozent der Breite, und das liest niemand mehr, der das Blatt ausgedruckt vor sich hat. Jetzt 3,8 % der Breite je Zeile und 0,40 Grad darin.

**Und die Zeichenerklärung rechnet, bevor sie schreibt.** Die Prüfung hieß „ist der Stift noch weit genug links" und ließ den letzten Eintrag anfangen und über den Rand hinauslaufen: Mit der größeren Schrift stand dort „voll 90–100" ohne das Prozentzeichen. Gefragt ist, ob ein Eintrag **ganz** hineinpasst — und passen nicht alle, gilt erst die kurze Fassung (nur die Namen), bevor Einträge wegfallen. **Eine Zeichenerklärung, der ein Eintrag fehlt, erklärt eine Farbe nicht, die im Bild steht.** *Gemessen*: bei 876 px die kurze Fassung mit allen fünf Zonen, bei 1.950 px die lange mit Spannen.

**Die Zonenregel (Windexposition).** Blatt 5 zeigt **fünf Zonen, keinen Verlauf**: windstill 0–20 %, geschützt 20–45 %, mittel 45–70 %, stark 70–90 %, voll 90–100 %.

Der stufenlose Verlauf war nicht zu lesen, und *die Messung sagt warum*: Über 34.573 freie Zellen liegt der Median bei **0,85**, und **45 % aller Zellen sitzen im obersten Zehntel**; unter 0,1 liegen nur 2 %. Eine Skala, die ihre Farben gleichmäßig über 0 bis 1 verteilt, **verbraucht die Hälfte ihres Vorrats an einem Wert, den fast die halbe Fläche hat** — und drückt alles Unterscheidbare in einen rosa Schmier.

**Zonen sind ohnehin die Frage dieses Blattes:** nicht „wie viel genau", sondern „wo zieht es und wo nicht". Die Grenzen sind eine Festlegung, keine Messung, und stehen darum in der Zeichenerklärung. **Die Farbfolge läuft von Blau über Magenta nach Gelb** — `#1739A1` · `#7C2BAB` · `#DA1B8A` · `#EE692F` · `#FACF42` — und **zwei Ordnungen fallen dabei zusammen**: die der Farben und die der Helligkeit (62 · 56 · 48 · 42 · 36, streng fallend), Sättigung überall über 60. Der erste Versuch hielt nur die Farbfolge ein: „stark“ war heller als „mittel“ und die blasseste Stufe von allen, und genau die wurde unter der Multiplikation **grau**. Eine graue Stufe in einer Farbfolge liest sich wie ein Fehler — als fehlte dort ein Wert. Der Weg von Blau nach Gelb führt über Violett, Magenta und Orange, und auf diesem Weg gibt es kein Grau. *Gemessene Flächenanteile*: voll 44,9 % · stark 18,0 % · mittel 17,6 % · geschützt 13,1 % · windstill 6,3 %.

**Auch die Farbproben stehen vor dem Titel.** Die Regel „Skala zuerst" galt nur für den Verlauf, und mit den Zonen fiel das auf: Von fünf Proben stand **eine** im ausgegebenen Bild, der Titel hatte den Rest verbraucht. Was die Farben erklärt, kommt zuerst; der Titel bekommt, was übrig bleibt, und wird gekürzt.

**Der Satz zur gesperrten Darstellung ist entfallen.** „Eine Darstellung ist hier gesperrt: Ein farbiger Grund unter einer Messrampe ergibt eine dritte Farbe …" stand auf allen drei rechnenden Blättern immer da. **Eine fehlende Wahl erklärt sich durch die Wahl, die dasteht** — wer Schwarzplan und Linie nebeneinander sieht, fragt nicht nach der Textur. Ein Satz, der immer dasteht, wird ohnehin nicht gelesen; er belegt nur die Zeile, in der eine echte Mahnung stünde.

**Die Rampensperre.** Blatt 3 und Blatt 4 zeigen **nur Ladybug** und haben keine Rampenwahl mehr; auf Blatt 3 ist zusätzlich die Deckkraft entfallen. Ladybug ist die Leiter, in der eine Einstrahlung in diesem Fach gelesen wird — Rhino, Grasshopper und jeder Bericht daneben nutzen sie. Drei Leitern anzubieten heißt, den Vergleich aufzugeben und dem Betrachter eine Entscheidung zu überlassen, die er nicht treffen will. Die Deckkraft fällt auf Blatt 3 aus demselben Grund wie bei der Aufsicht: **halb durchscheinend ist keine Darstellung, sondern die Mitte zwischen zweien**, und ein abgelesener Wert stünde nicht mehr fest. **Auf Blatt 4 und 5 bleibt sie** — dort ist sie nicht die Mitte zwischen zwei Darstellungen, sondern Teil der multiplizierenden Mischung, mit der der Boden durchscheint. Gleicher Regler, zwei verschiedene Aufgaben; gestrichen wird die, die keine hat.

Die Rampenleiste selbst bleibt auf allen drei rechnenden Blättern stehen: Sie ist die **Zeichenerklärung** und keine Auswahl. Blatt 5 trägt ohnehin eine eigene, versteckte Rampe (`windzug`), weil Blau–Pink–Gelb dort eine andere Aussage macht als eine Wärmeleiter.

**Die Deckungsregel (Marker).** Gefragt wird **erst die Auflage, dann das Modell** — nicht beide zugleich. Die gerechnete Auflage liegt auf denselben Flächen wie das Modell und wird nur mit `polygonOffset` davor gezeichnet; geometrisch ist sie deckungsgleich. `intersectObjects` sortiert nach Abstand, und bei deckungsgleichen Flächen entscheidet dann die Rundung. Das sah aus wie Zufall und war es: **An manchen Baukörpern kam der Marker, an anderen nicht**, weil dort das Modelldreieck vorn lag — und ein Modelldreieck trägt keinen Wert. Zwei Fragen nacheinander sind eindeutig.

**Und ein Treffer ohne Wert ist eine Auskunft, kein Fehlschlag:** Der Marker schreibt „nicht gerechnet", statt klanglos zu verschwinden und wie ein kaputter Klick zu wirken. Beim Messen fiel dabei ein zweiter Fehler auf: `toFixed(0)` machte aus 900 Wh/m² eine **Null** — eine Aussage, die dort nicht stimmt. Unter 10 kWh/m² steht jetzt eine Stelle hinter dem Komma.

**Einschalten ordnet neu.** Von Hand geschobene Schilder behalten ihren Platz, solange die Marker stehen — das ist der Sinn des Schiebens. Aber aus- und wieder einzuschalten ist die Geste, mit der man das Bild neu aufsetzt, und dann soll die Beschriftung wieder sitzen: Wer zwischenzeitlich gedreht, gezoomt oder Marker entfernt hat, hätte sonst Schilder an Stellen, die ihre Punkte längst verlassen haben. Rückgängig ist es mit einem Zug. *Gemessen*: Versatz −200 / 160 nach dem Schieben, nach aus und an keiner mehr, null Überlappungen.

**Die Schieberegel.** Markerschilder lassen sich **schieben**. Die selbsttätige Lage weicht Nachbarn aus, aber sie weiß nicht, was im Bild wichtig ist — ein Schild kann genau das Haus verdecken, um das es geht. Ein geschobenes Schild behält seinen Platz und nimmt am Ausweichen nicht mehr teil: **Wer von Hand gesetzt hat, will nicht, dass ihm etwas dazwischenrutscht.** Der Versatz hängt am Marker, nicht am Bildschirm, und übersteht deshalb das Drehen — *gemessen*: um 140 / 90 geschoben, nach einer Kameradrehung unverändert.

**Und ein Schild bleibt trotzdem kein Loch im Bild.** Ein Klick ohne Ziehen gilt der Fläche darunter und setzt dort einen Marker — *gemessen*: Klick auf ein Schild über gerechneter Fläche, 1 zu 2 Marker. Ohne das ginge jeder Klick verloren, der zufällig auf einem Schild landet; vorher war genau das der Fall (von vier Klicks kam einer an). Unterschieden wird an drei Bildpunkten Weg.

**Die Rollregel.** Gerollt wird **auf Verlangen, nicht auf Verdacht.** Beim ersten Setzen eines Markers rollt die Schiene zur Zahl — man will sie sehen und suchte sie sonst. Beim Nachrechnen nach einem Tageswechsel hat man sie nicht verlangt, und die Schiene sprang unter der Hand weg, mitten im Lesen. *Gemessen*: Rollstand 0 vor und nach dem Tagwechsel, während der Marker von 1:40 h auf 5:30 h nachrechnet.

**Die Einerleiregel.** Es gibt **eine Sorte Beschriftung im Feld**. Vorher waren es zwei: der Nachweis-Anschluss, den jeder Klick erzeugte, und daneben die Marker — zwei Dinge, die gleich aussahen, aber verschieden entstanden, verschieden verschwanden und verschieden hießen. Der Anschluss ist ersatzlos entfallen.

- **Ein Klick setzt einen Marker — sonst nichts.** Ohne eingeschalteten Marker tut ein Klick ins Feld nichts, und das Fadenkreuz erscheint auch nicht: Es wäre eine Zusage, die ein abgeschalteter Marker nicht einlöst.
- **Der erste Marker eines Blattes führt.** An ihm hängt der Nachweis nach DIN 5034-1. Er ist keine andere Art Marke, sondern dieselbe mit einer Aufgabe — darum unterscheidet ihn nur die Farbe (Akzent in Rahmen, Schrift, Linie und Punkt), nicht eine eigene Form. Wer den Nachweis in der Schiene liest, findet im Bild die Stelle, von der er handelt.
- **Der Nachweis rückt nach.** Wer den führenden Marker entfernt, will ihn loswerden, nicht das Blatt entwerten: Der nächste übernimmt. Bleibt keiner, verliert das Blatt seinen Nachweis und sagt das. *Gemessen*: zwei Marker, führend 1:40 h, Nachweis 100 min; nach dem Löschen führend 2:30 h, Nachweis 150 min.
- **Abgeschaltet heißt unsichtbar, nicht vergessen.** *Gemessen*: abgeschaltet 1 im Speicher, 0 im Bild; wieder an, 1 im Bild. Auch die Ausgabe folgt dem Schalter — wer die Marker wegnimmt, tut es meist für genau diese Aufnahme.
- **Alle gehen gleich weg:** über das Kreuz am Schild. Auch der führende; auch der Knopf „Nachweis löschen" in der Schiene geht diesen Weg, statt die Marke im Bild stehen zu lassen, an der dann nichts mehr hinge.

**Die Flächenregel.** Ein Marker auf dem Sonnenstandsblatt nennt die **Fläche**, auf der er sitzt: `Besonnung · Dach`, `Besonnung · Wand NW`. Ohne diese Angabe sehen zwei Marken auf demselben Baukörper nach einem Fehler aus — *gemessen* an einer Nordwand: 1:40 h am 21. März, wo ein Dach daneben ein Vielfaches bekommt. **Ein Dach bekommt die Sonne den ganzen Tag, eine Wand höchstens eine Hälfte davon, und welche Hälfte, sagt ihre Himmelsrichtung.** Die Angabe macht den Unterschied nicht nur erklärbar, sondern nachprüfbar. Norden ist −Z, Osten +X — dieselbe Ordnung, aus der `sonnenRichtung` ihre Azimute baut.

**Die Normale gehört zum Treffer, nicht zum Augenblick.** Sie wird an der Blickrichtung umgedreht, und die gilt nur im Moment des Klicks; wer sie später aus dem gemeinsamen Strahl liest — beim Nachrechnen etwa —, bekommt die Richtung eines fremden Klicks. Also einmal rechnen und am Treffer mitgeben.

**Die Nachrechenregel.** Ein anderer **Tag** ist eine andere Zahl: Der Marker zählt die Minuten *dieses* Tages, und die alte Zahl stehenzulassen wäre eine Behauptung über einen Tag, den das Blatt nicht mehr zeigt. Verglichen wird auf den Tag und **nicht auf den Zeitpunkt** — die Besonnungsdauer summiert den ganzen Tag, die Stunde ändert daran nichts, und sonst liefe bei jedem Zug an der Maßkette eine Rechnung los, die dasselbe Ergebnis hätte. *Gemessen*: 21. März 1:40 h → 21. Juni 5:30 h, nur die Stunde verschoben → unverändert. Die Feldblätter verlieren ihre Marker beim neuen Lauf weiterhin: Dort hängt der Wert an einer Auflage, die es danach nicht mehr gibt.

**Die Markerlinienregel.** Die Anschlusslinie eines Markers trägt einen **festen dunklen Ton** (`--marke-linie`), nicht die Tinte des Schemas. Sie läuft über das Modell, und das ist in beiden Schemata hell; mit `--tinte` wäre sie im dunklen Schema selbst hell und verschwände genau dort, wo sie gebraucht wird. Dieselbe Überlegung wie beim Bahnblau: **Die Farbe richtet sich nach dem Grund, über dem sie liegt, nicht nach dem Schema der Oberfläche.**

**Die Draufsichtregel.** Die Planansicht ist orthogonal, auf den **Rahmen des Datenvertrags** gestellt, Norden oben, Drehen abgeschaltet und die linke Taste auf Schieben. Sie steht mit Rand im Feld (Faktor 1,14), eine Haarlinie in `--tinte-2` zeichnet das Plangebiet, und ein **Passepartout** aus vier Flächen in `--blatt` deckt alles außerhalb zu — zugedeckt, nicht geschnitten, denn Schnittebenen zeigen das hohle Innere der Baukörper. Die Feldmöbel (Maßstabsleiste, Nordpfeil, Bedienhinweis) entfallen dort; der Maßstab steht in der Statuszeile, Norden ist oben, und ein Bedienhinweis stünde auf einer Fläche, die ausgegeben wird. **Die Ausgabe speichert genau den Rahmen** — der Ausschnitt wird durch Projektion der Rahmenecken mit derselben Kamera gerechnet, mit der gerendert wurde. Sie existiert wegen einer Eigenschaft, nicht wegen der Optik: **Dort gilt der Maßstab für das ganze Bild**, in der Raumansicht nur an der Drehachse. Deshalb trägt jede Ausgabe aus dem Plan das Wort „Draufsicht" in der Fußleiste und `_plan` im Dateinamen — ein Blatt, aus dem jemand misst, muss sagen, welche Art von Bild es ist.

**Die Franseregel.** Zellen unter einem Baukörper werden **gezeichnet, aber nicht gezählt**. Übersprungen ließen sie die Karte ausfransen: Bei 8 m Raster fällt jede Zelle weg, deren Mitte unter einem Dach liegt, und das ist ein Ring, der breiter ist als das Haus — in der Draufsicht stand um jeden Baukörper ein weißer Saum. Gezählt werden sie trotzdem nicht: Unter einem Dach kommt keine Sonne an, und diese Nullen zögen jeden Mittelwert nach unten. **Zeichnen und Zählen sind zwei Entscheidungen, nicht eine** — und wo sie auseinandergehen, steht es im Blatt.

**Die Bandregel.** Die Sonnenbahnen sind **Rohre**, keine Linien, und tragen ein eigenes, voll gesättigtes Blau (`--bahn`, 212° · S 100 % · L 42 %). `THREE.Line` ist in WebGL immer einen Bildpunkt breit — `linewidth` ist dort wirkungslos —, und ein Haarstrich über einer gemusterten Fläche hat an jeder Stelle einen anderen Nachbarn. Zweimal die Farbe zu vertiefen half deshalb nicht: **Das Problem war die Breite, nicht der Ton.** *Gemessen* bei gleichem Blickwinkel und gleicher Zeit: 1.051 blaue Bildpunkte als Linie, 2.105 als Band.

**Kein Saum.** Ein Zwischenschritt gab dem Rohr einen Rand in der Farbe des Himmels, damit es sich vom Grund löse. Über dem hellen Modell stand damit ein dunkler Mantel um die Bahn, und die las sich als Rohr statt als Zeichnung. **Ein voll gesättigtes Blau trägt sich selbst** — gegen das Grau des Modells wie gegen das Schwarz des Himmels, in beiden Schemata mit demselben Wert. Ein Rand hätte nur das ausgeglichen, was die Farbe nicht leistete.

**Die Jahresbahn wie die Tagesbahn.** Blatt 2 trug drei Stufen der Tintenleiter — eine eigene Sprache für dieselbe Sache, die jeder neu lernen musste, der von Blatt 1 herüberkam. Jetzt dasselbe Blau und dieselbe Bauform; getrennt werden die drei **zweifach**, durch die Helligkeitsstufe und durch die Stärke (0,0029 · 0,0023 · 0,0018 × Himmelsradius, gegen 0,0045 auf Blatt 1). Die Stärke war von Anfang an gemeint — „wie in einem Bestandsplan" stand schon im Quelltext — und ging nur nicht, solange es Linien waren. Die siebzehn Analemmen wandern dafür in die Tintenleiter: Wo Blau die Bahn ist, kann der Schleier nicht auch blau sein.

**Die Jahresuhrregel.** Wo über das Jahr verglichen wird, gilt **Normalzeit (MEZ)**. Am letzten Sonntag im März springt die Uhr, und dieselbe Uhrzeit meint vor und nach dem Sprung zwei verschiedene Sonnenstände — *gemessen* am 28./29.03.2026 um 14:00: Azimut 209,46° gegen 191,19°, Höhe 35,60° gegen 39,07°. **18 Grad Sprung, wo der Tagesschritt 0,2 Grad beträgt.** Das trifft die Analemmen (eine Acht mit zwei Absätzen ist keine Acht) und den Jahreslauf.

**Nicht die Sonne springt, sondern die Uhr — also springt die Anzeige.** Der Lauf hält die Stunde in MEZ fest und lässt die angezeigte Uhrzeit von 14:00 auf 15:00 wechseln, statt die Stunde festzuhalten und die Sonne springen zu lassen. Beides ist dann wahr zugleich: Die Marke bleibt auf dem Analemma, und sie steht dort, wo die Sonne zur angezeigten Zeit wirklich steht. *Gemessen* über den Sprung hinweg: 208,76° · 209,22° · 209,70° · 210,18° — gleichmäßige Schritte, kein Absatz. Die Zeichenerklärung nennt die Uhr („stündlich · MEZ"), denn eine Uhr, die vom Gewohnten abweicht, muss dastehen. Blatt 1 behält die bürgerliche Zeit: Es zeigt einen Augenblick, und dafür gilt, was auf der Armbanduhr steht.

**Die Zoomregel.** „Einpassen" setzt in der Draufsicht auch den Zoom auf 1. Eine Parallelkamera zoomt nicht über den Abstand, sondern über `zoom`; `planKameraSetzen` rechnet nur den Ausschnitt und ließ ihn stehen. Einpassen brachte damit die Mitte zurück und die Vergrößerung nicht. Im Plan ist der Ausschnitt aber die ganze Aussage — dort gilt der Maßstab für das ganze Bild, und ein halb eingepasster Plan ist keiner.

**Die Stärkeregel — gestrichen.** Der Regler, der die Aufsichts-Textur halb durchscheinend stellte, ist entfallen. Halb durchscheinend ist keine Darstellung, sondern die Mitte zwischen zweien: Die Zeichnung wird blass, der Grund schimmert durch, und was man misst, steht nicht mehr fest. Die Darstellung wählt man in der Leiste, an oder aus mit dem Haken — dazwischen gibt es nichts zu entscheiden.

**Der Nebenweg spricht leiser.** „Ordner statt ZIP" stand als gleich lauter Knopf neben dem Laden. Ein Knopf für beides ginge nicht — der Browser öffnet für Dateien und für Ordner zwei verschiedene Dialoge, und welchen er zeigt, entscheidet `webkitdirectory` am Eingabefeld, nicht der Nutzer im Dialog. Zwei Wege bleiben es also, aber nicht zwei gleichwertige: Das ZIP ist der Regelfall, der ausgepackte Ordner der Sonderfall und steht als stiller Knopf in einer Zeile Fließtext.

**Rechts gilt dasselbe, mit einem eigenen Namen für die Faltung: „Was hier nicht steht".** *Gemessen* auf dem Stadtraum: 910 Bildpunkte Fließtext an zwölf Stellen, 290 Wörter — mehr Text als Zahl. Die Abgrenzungen („Dies ist Strahlung, keine Temperatur", „Dies ist kein CFD") sind die Ehrlichkeit des Blattes; **sie zu streichen wäre falsch, sie dauernd offen zu zeigen drängt die Zahlen aus dem Bild.** Also dieselbe Bauform wie die Vorbehalte links: zugeklappt, die Grenze in der Kopfzeile benannt, die Begründung auf Verlangen. Eine Regel, zwei Orte. Dazu sechs Bedienhinweise gekürzt. Ergebnis: sichtbarer Fließtext 910 → 420 px (Stadtraum) und 890 → 348 px (Windexposition), die Schiene 2.001 → 1.623 px.

**Die Merkregel.** Ein gerechneter Wert lässt sich an seiner Stelle **festhalten**: Klick ins Modell setzt eine Marke mit Anschlusslinie und Schild, Klick auf das Schild nimmt sie weg. Der Anlass ist, was eine Messrampe nicht kann — sie sagt „hier mehr, dort weniger", nicht *wie viel*. Wer eine Fassade besprechen will, braucht die Zahl an dieser Fassade.

Drei Bindungen, ohne die es keine Marke wäre, sondern ein Aufkleber:

- **Eine Marke gehört ihrem Blatt.** Die Strahlungslast des Stadtraums auf dem Windblatt wäre eine Zahl ohne ihre Frage. Beim Blattwechsel verschwinden die Marken und kommen beim Zurückkommen wieder; auf der Sonnenbahn gibt es den Knopf gar nicht, denn sie zeigt den Himmel und nicht die Stadt.
- **Eine Marke überlebt ihren Lauf nicht.** Beginnt eine neue Rechnung oder gilt die alte als veraltet, verschwindet sie. Eine stehengebliebene Zahl wäre eine Aussage über einen Zustand, den es nicht mehr gibt — sichtbar zu verschwinden ist ehrlicher als beides, Stehenbleiben wie stillschweigendes Umrechnen.
- **Eine Marke steht im ausgegebenen Bild.** Sonst hielte „Festhalten" nur bis zum nächsten Blattwechsel. Die Ausgabe rechnet die Lagen **neu** statt sie vom Bildschirm zu übernehmen: Die Planausgabe rendert mit größerem Puffer, Bildschirmpunkte träfen dort die falsche Stelle.

**Das Schild ist eine Beschriftung, kein Bedienteil.** Es war beides, und das kostete Marken: Ein Schild liegt dicht am nächsten Punkt, den man anklicken will, fing den Klick ab — und nahm die Marke weg, statt die nächste zu setzen. *Gemessen*: von vier Klicks dicht beieinander kam einer an. Jetzt lässt das Schild den Zeiger durch, allein ein **Kreuz** fängt ihn, und darum ist das Kreuz auch ständig sichtbar: Ein Bedienteil, das erst beim Überfahren erscheint, fände in einem Schild ohne Überfahren niemand. Die Anleitung steht im **Bedienhinweis** am Feldrand, nicht in der Schiene — dort, wo die Geste beschrieben wird, die sich gerade geändert hat.

Gelesen wird der Wert dort, wo das Blatt ihn führt: auf der Gebäudehülle je Dreieck der Auflage über den Strahl, auf Stadtraum und Windexposition über die Rasterzelle unter dem Weltpunkt, auf dem Sonnenstand als eigene Besonnungsrechnung für diesen Punkt. Unter einem Dach steht „überbaut" statt einer Null — dort wird gezeichnet, aber nicht gezählt (siehe Franseregel), und eine Null von dort sagte etwas Falsches über den Stadtraum. Die Schilder weichen einander **und dem Anschlussschild des Nachweises** aus: Wer schon sitzt, behält seinen Platz, der Nächste rutscht nach unten — sonst deckte eine Marke die Zahl zu, wegen der man hinsieht. *Gemessen* mit sieben Marken in einem Haufen: null Überlappungen.

**Die Schienenregel.** In beiden Schienen stehen **Zahlen in Zeilen, Sätze nur für das, was keine Zahl ist.** *Gemessen* vorher: 877 von 1.372 Bildpunkten des Modellteils waren Fließtext — **64 %**, 193 Wörter, die Schiene lief über. Nachher 1.143 Bildpunkte Gesamthöhe und rund ein Viertel Text.

Vier Griffe, jeder mit einem eigenen Grund:

- **Die Höhenherkunft wurde eine Tabelle.** Ein Satz reiht drei Zahlen in drei Nebensätzen; eine Tabelle stellt sie untereinander und vergleicht sie dabei. 316 Bildpunkte wurden 100. **Die Einschränkung bleibt ein Satz** — sie ist eine Aussage über die Belastbarkeit und keine Zahl.
- **Die Vorbehalte sind zugeklappt, aber nicht versteckt.** Die Kurzform steht in der Kopfzeile und ist immer lesbar, die Begründung kommt auf Verlangen. Eine Einschränkung, die man aufklappen muss, um sie überhaupt zu ahnen, wäre keine; als Absatz drängt sie die Zahlen aus dem Bild.
- **Was zwei Zentimeter tiefer steht, wird nicht angekündigt.** „Ein Nolli-Paket bringt Datenvertrag, Modell und Aufsicht mit" ist gestrichen — genau diese drei Zeilen stehen darunter. Derselbe Grund, aus dem der Untertitel „Modell, Textur, Vertrag" schon früher entfiel.
- **Der Rest wurde kürzer, nicht weniger.** Der Startpakethinweis ist eine Zeile statt eines Absatzes; dass ein eigenes Paket dieses ersetzt, sagt der Knopf darunter besser als ein Satz darüber.

**Die Griffregel.** „Einpassen" steht am **rechten Ende der Darstellungsleiste**, über dem Zeichenfeld — und nur dort. Es richtet sich auf das Bild und wird gebraucht, während man darin herumfährt; der Weg in die Modelltafel führte dafür durch einen Teil, der von etwas anderem handelt. Nolli setzt „Ansicht zurücksetzen" aus demselben Grund über sein Ansichtsfenster. **Zwei Knöpfe für dieselbe Tat sind zwei Orte, an denen jemand sucht**, also ist der alte in der Tafel entfallen. Der Knopf trägt **keinen Punkt**: Der Punkt der Nachbarknöpfe zeigt einen Zustand an (Draufsicht ein, Bäume ein), und eine Tat hat keinen. *Gemessen* von 1440 bis 390 px: rechtsbündig ohne Abstand, nie mit der Darstellungsgruppe überlappend; Kameraabstand 4.563 → 1.826 nach dem Druck.

**Die Teilungsregel.** Die Stundenmarken müssen aus dem Band **herausstehen**, sonst sind sie keine Teilung, sondern eine Struktur darin. Mit dem Rohr wurde das zum Rechenverhältnis statt zum Augenmaß: Der Markenradius lag bei 0,009 und damit unter dem Banddurchmesser von 0,014 — die Stunden saßen als Dellen im Band. 0,013 gibt ihnen 0,026 Durchmesser, knapp das Doppelte des Bandes. Die Sonnenmarke geht auf 0,028 mit, auf beiden Sonnenblättern gleich: **Sie ist dieselbe Sache und darf nicht auf zwei Blättern zwei Größen haben.**

**Die Mittenregel.** Das Himmelsgewölbe sitzt auf der **Mitte des Rahmens**, nicht auf dem Weltursprung. Die Bahnen entstehen aus Richtungsvektor mal Radius und lagen damit um den Nullpunkt; das Modell liegt um seine eigene Mitte, und die ist verschoben. Sichtbar war es als Bogen, der neben dem Plangebiet stand statt darüber. Dieselbe Mitte, die `rahmenKasten` für den Ausschnitt nimmt — die Fläche, die Nolli als Ergebnis meint. Es gilt für die Bahn, die Stundenmarken und die Sonnenmarke gleichermaßen; eine Marke, die der Bahn nicht folgt, wäre schlimmer als eine verschobene Bahn. *Gemessen:* Bahnmitte und Plattenmitte weichen um 0,0 m ab.

**Die Vorratsregel.** Die Stufen mit gehaltenem Schwarzwert laufen im **Nebenfaden** und werden **gebaut, bevor jemand umschaltet**. Der Weg dorthin ging über zwei Fehlversuche, und beide sind lehrreich:

| Wo die Rechnung lief | Was man sah |
|---|---|
| nachgereicht im Leerlauf | das Bild stellt scharf, beim Umschalten als zweite Änderung |
| vorweg im Hauptfaden | das Werkzeug steht still, *gemessen* 1.173 ms beim ersten Umschalten |
| im Nebenfaden, auf Vorrat | nichts — der Wechsel ist da, sobald die Taste gedrückt ist |

**Beide Fehlversuche sind dasselbe Symptom: Die Rechnung gehörte nicht auf den Hauptfaden.** Sie kostet *gemessen* 550 bis 1.500 ms je Textur; wo immer man sie dort hinlegt, fällt sie auf. Der Nebenfaden bekommt den Blob und entschlüsselt selbst (`createImageBitmap`, `OffscreenCanvas`), zurück kommen die Stufen als übertragene Puffer. Schlägt er fehl oder fehlt er im Browser, bleiben die gewöhnlichen Stufen stehen: blassere Linien, aber ein laufendes Werkzeug.

**Entschlüsselt wird ebenfalls nicht auf dem Hauptfaden.** `TextureLoader` wartet nur auf `load` und überlässt das Entschlüsseln dem ersten Zeichnen; mit dem Vorrat waren das plötzlich drei Bilder à 4096 × 3072. *Gemessen* fiel die Bildrate beim Start von 90 auf 33 Bilder mit Stockungen über einer Sekunde, mit `img.decode()` stieg sie auf 120 — besser als ohne eigene Stufen überhaupt. Ein `Image` bleibt es dabei: Eine `ImageBitmap` stünde auf dem Kopf, weil WebGL sie nicht spiegeln kann, die Stufen daneben aber sehr wohl gespiegelt werden.

**Drei Aufsichten bleiben im Speicher** — so viele, wie ein Nolli-Startpaket mitbringt. Die gezeigte ist immer die zuletzt benutzte und wird nie verworfen; die älteste wird mit `dispose` verworfen, sonst bliebe sie auf der Grafikkarte liegen, ohne dass jemand sie noch erreichen kann. Ein neues Paket leert den Speicher, denn die behaltenen Aufsichten passen nicht auf einen neuen Rahmen. Ein laufender Bau wird in `AUFSICHT_UNTERWEGS` gehalten: Ein Tastendruck hängt sich an den Vorrat an, statt eine zweite Rechnung anzuwerfen. *Gemessen nachher:* Wechsel 0 ms, das Bild bei 150 ms schon das richtige und bis 3.000 ms auf den Bildpunkt gleich, und der Schwarzwert der Linienzeichnung steht auf jeder Stufe bei 130 — dem dunkelsten Punkt der Vorlage.

**Der Preis steht im Start:** Der Boden erscheint *gemessen* nach 1.442 ms statt sofort, weil die erste Textur fertig gezeigt wird. Das ist der richtige Tausch — währenddessen läuft der Fortschritt, und ein Bild, das sich hinterher noch ändert, gibt es nirgends mehr.

**Die Nachfrageregel.** Das Startpaket wird mit `{ cache: 'no-cache' }` geholt — **nachfragen statt annehmen**. Der Server schickt zu diesen Dateien nur ein `Last-Modified`; der Browser schätzt die Haltbarkeit dann selbst und nimmt eine lange an. *Gemessen:* Beim gewöhnlichen Neuladen kamen `frame.json` und `modell.obj` mit „200 aus dem Zwischenspeicher" ohne jede Rückfrage; mit `no-cache` kommt ein 304, und die 529 kB des Modells wandern weiterhin nur einmal über die Leitung. **Ein hartes Neuladen ist kein Ersatz** — es erfasst den Seitenaufbau, das Paket wird aber später aus dem Quelltext geholt. Erkennbar ist der Fall am Dreieckszähler: Er gehört zum geladenen Modell und nicht zur HTML, weicht er vom Server ab, ist das Bild älter als die Datei.

**Die Kantenregel.** Nolli zerlegt jeden Baukörper, der die Rahmenkante kreuzt, und hängt dem Teil davor `_ausserhalb` an (62 von 686 im mitgelieferten Paket). Dieser Teil wird **nicht gezeichnet, aber gerechnet**. Nicht gezeichnet, weil er sonst über die Bodentextur hinausragt, die genau den Rahmen deckt — die Kante fransté aus, in der Raumansicht wie im Plan. Gerechnet, weil ein Haus knapp vor dem Rahmen seinen Schatten hereinwirft und ihn behalten muss.

**`visible = false` wäre der naheliegende Griff und ist falsch:** three.js überspringt ein unsichtbares Netz auch beim Schattenwurf. Der Außenteil verschattete dann in der Zahl und nicht im Bild — dieselbe Sorte Widerspruch wie ein eingebrannter Schatten, nur andersherum. Stattdessen ein **eigenes Material ohne Farb- und Tiefenschreiben**: Im Hauptdurchgang hinterlässt es nichts, im Schattendurchgang zählt es mit, denn der rechnet mit dem Tiefenmaterial. *Gemessen* im A-B-A-Versuch: Der Außenschatten trägt 35 (8 Uhr), 129 (13 Uhr) und 339 (17:30) dunkle Bildpunkte bei, und der Zählstand kehrt beim Zurückschalten auf den Punkt genau zurück.

Das Material muss dafür **geklont** werden — alle Baukörper teilen sonst eine Instanz, und die Kante hätte das ganze Modell verschwinden lassen. Wer nicht gezeichnet wird, bekommt auch **keine Umrisslinie** (sonst stünde er als Drahtgitter da, wo er gerade verschwinden sollte) und wird **nicht ausgewertet** (sonst trüge die Fassadenzahl Flächen bei, die auf dem Blatt nicht vorkommen). Verschattet wird er weiterhin über `alleNetze()`, das Auswerten geht über `gebaeudeNetze()` — **zwei Listen, weil es zwei Fragen sind.**

**Die Schwarzwertregel.** Beim Verkleinern einer Textur mittelt die Grafikkarte, und eine haardünne Linie mittelt sich weg. *Gemessen* an Nollis Linienzeichnung: nur 0,02 % der Bildpunkte sind dunkler als 140, der dunkelste ist 130 — auf Bildschirmmaß bleibt davon **193**, eine Stufe tiefer 213. Die Mipstufen werden deshalb selbst gebaut und jede so gestreckt, dass ihr dunkelster Wert wieder der der Vorlage ist.

**Der naheliegende Griff wäre falsch:** „dunkelstes statt gemitteltes Verkleinern" rettet die Linie und macht beim Schwarzplan die Häuser mit jeder Stufe fetter, weil dort das Dunkle die Fläche ist. Ein Mittel, das eine Darstellung rettet und die andere verfälscht, taugt nicht. **Die Verkleinerung darf nichts hinzufügen, aber sie soll auch nichts wegnehmen** — mehr als den Schwarzwert der Vorlage bekommt keine Stufe.

Gerechnet wird es **nachgereicht**, nicht vorweg: Die Aufbereitung kostet je Textur einige hundert Millisekunden, und „gefüllt starten" ist eine Produktregel. Erst mit den gewöhnlichen Stufen zeigen, dann in der Leerlaufzeit nachschärfen.

**Die Bahnfarbenregel.** Tagesbahn und Analemmen tragen `--akzent-tief`, nicht `--akzent` — über dem hellen Schwarzplan verschwand der Akzent fast. Der tiefe Ton ist im hellen Schema dunkler und im dunklen heller; dieselbe Absicht, beide Male gegen den Grund. *Gerechnet*: gegen einen hellen Grund 5,54 : 1 statt 3,68 : 1, gegen den dunklen 8,98 : 1 statt 6,63 : 1. Die Analemmen stehen zusätzlich auf 85 % statt 55 % Deckkraft — **Strichstärke ist kein Mittel**, `linewidth` ist in WebGL wirkungslos, also bleiben Farbe und Deckkraft. Die Farbproben in der Zeichenerklärung führen denselben Ton, sonst erklärt die Legende eine andere Linie als die gezeichnete.

**Die Schattenregel.** Wo eine Auswertung über dem Modell liegt, ist der gezeichnete Schlagschatten **aus** — er legt sich über die Messfarbe und macht daraus eine dritte. Wo der Schatten der Gegenstand ist, ist er **an**. Das hängt am Blatt, nicht an einem Schalter: Ein Schalter dafür stand kurz da und ist wieder heraus, weil es keine Lage gibt, in der man es anders will als das Blatt es verlangt — **ein Schalter, der immer gleich steht, ist keiner.** Unberührt bleibt die Verschattung in der Rechnung; die steckt im Strahltest.

**Die Verstecken-Regel.** Ein Element mit `hidden` verschwindet nur, wenn keine Klasse ein `display` dagegensetzt — eine Klassenregel schlägt das voreingestellte `[hidden]{display:none}` des Browsers. Jede Klasse, die `display` setzt und auf Elementen liegt, die versteckt werden, braucht ihr eigenes `[hidden]`. Aufgefallen ist es nicht in der Prüfung, sondern im Bildschirmfoto: **Die Prüfung las die Eigenschaft `hidden`, nicht das, was gerendert wird.**

**Die Kachelregel.** Eine Ausgabe fürs Datenpaket ist **kein Blatt**: keine Fußleiste, keine Legende, kein Rand — und sie wird **neu gerendert** auf die Pixelmaße des Vertrags, nicht aus dem Fenster geschnitten. Ein Blatt trägt Beschriftung, eine Kachel trägt Deckungsgleichheit; beides in einem Bild zu verlangen, ergibt keines von beiden. Der Dateiname trägt die Herkunft (`_umbra`), damit eine gerechnete Karte im Paket nicht wie eine gezeichnete aussieht.

**Die Ablageregel.** Weglegen ist nicht wegwerfen. Ein Blattwechsel nimmt eine gerechnete Auflage aus der Szene, **nicht aus dem Blatt** — `ablegen`/`hervorholen` sind umkehrbar, `verwerfen` nur bei neuer Geometrie oder vor einem neuen Lauf. Vorher nahm der Wechsel beides: Zurückgekommen meldete das Blatt „gültig", zeigte seine Zahlen und hatte kein Bild mehr (gemessen: 2,7 % farbige Fläche vorher, 0 % nachher). **Ein Zustand, der „gültig" heißt und nichts zeigt, ist schlimmer als einer, der „offen" heißt** — der erste behauptet etwas, der zweite gibt zu.

**Die Bodensperre.** Ein Blatt darf die Böden einschränken, auf denen es gelesen werden kann, und einen als Eröffnung nennen (`darstellungen:{erlaubt,vorgabe}`). Eine Messrampe über einem farbigen Grund ergibt eine dritte Farbe, die keine von beiden erklärt — Blatt 4 und 5 lassen deshalb nur Linie (Vorgabe) und Schwarzplan zu. **Gesperrtes erscheint gar nicht**, statt ausgegraut dazustehen: Ein Knopf, der da ist und nicht geht, erklärt sich nicht; einer, der fehlt, wirft die Frage auf, und die beantwortet ein leiser Satz neben der Leiste — in `--tinte-3`, nicht in Warnfarbe, denn eine Regel des Blattes ist kein Fehler.

**Die Weglassregel** (mit ihrer Ausnahme). Wo ein Phänomen nicht ist, wird nichts gemalt — die Auflage beginnt bei Weiß, das beim multiplizierenden Mischen die Identität ist. **Sie gilt nicht, wo beide Enden ein Befund sind.** Auf der Windkarte ist der Windschatten so interessant wie die Zugluft; mit Weiß am unteren Ende war der gesuchte Fund der einzige unmarkierte Teil des Bildes. Dort trägt das untere Ende eine eigene Farbe (Gelb).

 Wo ein Phänomen nicht ist, wird nichts gemalt. Die Windrampe beginnt bei **Weiß**, und weil die Auflage multiplizierend gemischt ist, ist Weiß die Identität — die Karte darunter bleibt unberührt. Die Tinte geht dorthin, wo etwas zu zeigen ist. Die erste Fassung färbte das untere Ende dunkelblau; damit war die windstille Hälfte des Bildes die dunkelste, und das Blatt betonte, wo nichts ist.

**Die Rampenendenregel.** Die Enden einer Messrampe tragen ihre **Bedeutung**, nicht nur ihre Zahl — in der Oberfläche und in der ausgegebenen Legende. „0 %" und „100 %" sagen niemandem, welches Ende gemeint ist; „0 % · geschützt" und „100 % · frei angeströmt" schon. Anlass: Beim ersten Ansehen der Windkarte kam die Frage „was ist starker Wind, das Gelbe?" — und sie kam zu Recht. Wo eine Rampe eine Größe zeigt, die weder gut noch schlecht ist, steht dazu, dass das Blatt nicht urteilt.

**Die Gegenlaufregel.** Wo eine Größe je nach Tageszeit in beide Richtungen wirkt, bekommt sie zwei Darstellungen und einen Satz, der das Vorzeichen nennt — nicht eine Karte, die eine Hälfte verschweigt. Der Himmelsanteil auf Blatt 4 lässt tagsüber Diffusstrahlung herein und nachts Wärme heraus; er steht deshalb als eigene Darstellung neben der Strahlungslast, nicht als Zwischenwert in ihr. Eine Karte, die nur den Tag zeigt, hat die Nacht falsch.

**Die Namensregel (Blätter).** Blatt 3 heißt **Hüllflächen**, nicht mehr „Gebäudehülle“: Die Gebäudehülle ist im deutschen Bauwesen die *thermische* Hülle — U-Werte, Dichtheit —, und das ist die falsche Fährte für ein Blatt, das Sonne auf Fassaden und Dächern misst. „Hüllflächen“ behält den Gedanken und zeigt auf das, was gemessen wird: die Flächen. Als Paar mit **Stadtraum** liest es sich als Flächen gegen Raum, Figur gegen Grund. Verworfen: „Fassaden“ (lässt die Dächer weg, und die entscheiden über PV) und „Baukörper“ (das Wort zählt in Umbra schon etwas anderes, nämlich die 686 Körper des Pakets). Blatt 1 heißt jetzt „Sonnenstand · Tag“, Blatt 2 „Sonnenbahn · Jahr“: Die beiden Namen allein lagen zu dicht beieinander, so wie vorher „Einstrahlung“ und „Strahlungslast“. Der Zusatz nennt die Zeitspanne, die das Blatt behandelt — das ist der Unterschied zwischen ihnen. Die Lieferprüfung trennt die Blattnamen seither mit senkrechtem Strich; mit Mittelpunkten wären aus fünf Namen sieben geworden. Ein Blatt heißt nach dem, was es rechnet, nicht nach dem, wonach gefragt wurde. **Und zwei Blätter heißen verschieden genug, dass man sie nicht verwechselt:** „Einstrahlung" und „Strahlungslast" lagen zu nah beieinander; sie heißen seit dem 17.09.2026 nach ihrem Empfänger — **Gebäudehülle** (Fassaden und Dächer) gegen **Stadtraum** (der Boden dazwischen) —, und die gerechnete Größe steht im Untertitel. Gefragt war eine Klimadarstellung; gerechnet wird Strahlung, ohne Luftwärme, Wind und gespeicherte Wärme. Also „Strahlungslast". Dieselbe Regel hat PV das Blatt gekostet — der Name darf nicht mehr versprechen als die Rechnung hält.

**Die Deckelregel.** Kein `min-height` auf Rasterelementen der Fläche. Ein Grid-Kind mit Mindesthöhe wächst über seine Zeile hinaus und schiebt sich über den Nachbarn — so verschwand der Blattkopf hinter dem Zeichenfeld. Die Höhe kommt aus der Zeile; ein Bereich, der überlaufen kann, deckelt sich selbst (`max-height:44vh` / `40vh`) und bekommt eigenen Bildlauf.

## Elevation & Depth

Das System ist flach, mit genau einer Ausnahme: dem Blatt auf der Unterlage. Tiefe entsteht sonst durch Tonwert — `--senke` liegt unter `--blatt`, `--grund` steht neben beidem — und durch Haarlinien, nicht durch Schatten. Es gibt keine Hover-Erhebung, kein `translateY`, kein Aufleuchten. Zustand steht in Tinte.

### Shadow Vocabulary
- **Heben** (`--heben`: hell `0 1px 2px rgba(17,17,17,.05), 0 12px 32px -12px rgba(17,17,17,.14)`; dunkel `0 1px 2px rgba(0,0,0,.4), 0 14px 36px -14px rgba(0,0,0,.7)`): ausschließlich unter dem Zeichenfeld. Ein Blatt Papier, das auf einer Unterlage liegt.
- **Heben klein** (`--heben-klein`: hell `0 1px 2px rgba(17,17,17,.06)`; dunkel `0 1px 3px rgba(0,0,0,.45)`): für das, was *auf* dem Blatt liegt — Feldhinweis, Anschlussschild, die Felder der Reihe.

### Named Rules

**Die Blatt-auf-Unterlage-Regel.** Haarlinie ist die Blattkante, Schatten ist die Abhebung — beides zusammen, aus Nollis Sprache geerbt. Am `.zeichenfeld` stehen deshalb `border:1px solid var(--linie)` und ein weiter, weicher Schatten gleichzeitig. Das ist Absicht und kein Widerspruch; statische Prüfer melden die Kombination gelegentlich als „dünner Rahmen, weiter Schatten" und liegen hier falsch.

**Die Ausblendkantenregel.** Eine überlaufende Schiene bekommt eine Ausblendkante, keinen harten Schnitt. Als letztes Kind des Laufbereichs steht `.schiene-kante`: `position:sticky; bottom:0; height:28px; margin-top:-28px; background:linear-gradient(to bottom, transparent, var(--blatt))`, geschaltet über `data-zeigt` mit `opacity`-Übergang 0,15 s. Der negative obere Abstand legt sie *über* den Inhalt, statt ihn weiterzuschieben. Nachgeführt wird an drei Stellen — `scroll` (passiv), `ResizeObserver` auf dem Laufbereich und `toggle` jeder Falte — plus nach jedem Neuzeichnen des Blattes; sie verschwindet, sobald weniger als 4 px Rest bleiben. Grund: Ein Schnitt auf halber Glyphenhöhe liest sich als Darstellungsfehler, nicht als „hier geht es weiter". Dazu gehören die beiden anderen Mittel: sichtbare schmale Laufleiste (8 px, `--linie-stark`) und `padding-bottom:var(--block)` unter dem letzten Teil, damit der Schnitt in den Zwischenraum fällt.

## Shapes

Zwei Radien, sonst nichts: **4 px** (`--rund`) für alles Bedienbare und alle Behälter — Knöpfe, Felder, Blattknöpfe, Urteilskasten, Feldhinweis, Rollbalkengriff. **2 px** (`--klein`) für Kleinstflächen, bei denen 4 px zur Kugel würde: Farbproben (11–14 px), Anschlussschild, Rampenleiste, Fokusring. Kreisförmig (`50%`) sind nur drei Dinge, und alle drei sind Marken, keine Flächen: die Blattziffer (20 px), der Zustandspunkt (7 px), der Reglerknopf (12 px).

Das Zeichenfeld hat **keinen** Radius. Ein Blatt hat rechte Winkel.

Rahmen sind immer 1 px. Es gibt keine 2-px-Umrisse außer dem Fokusring (`2px solid var(--akzent-tief)`, Versatz 2 px). Flächen werden nicht durch Kästen abgegrenzt, sondern durch Haarlinien zwischen ihnen: `.teil`, `.wertzeile`, `.klasse`, `.ebene` und `.nachweis-zeile` tragen ihre Trennung als `border-top` am Folgeelement, nicht als Rahmen um sich selbst.

### Named Rules

**Die Haarlinienregel.** 1 px `--linie` ist das einzige Trennmittel. Keine Schlagschatten zur Abgrenzung, keine Hintergrundwechsel für Zebrastreifen, keine doppelten Linien. Reicht die Linie nicht, fehlt Abstand, nicht Kontrast.

## Components

### Buttons
- **Shape:** leicht gebrochene Ecken (4 px), Rahmen 1 px.
- **Knopf (Standard):** Grundfläche (`--grund`), Rahmen `--linie`, Schrift `--tinte-2` bei 12,5 px / 500, Polster `7px var(--naht)`. Hover ändert nur den Rahmen auf `--linie-stark` — keine Flächenänderung, keine Bewegung.
- **Gedrückt (`aria-pressed="true"`):** kehrt vollständig um — Fläche `--tinte`, Rahmen `--tinte`, Schrift `--blatt`. Zustand steht in Tinte, nicht in einem Tonwert. Eine Beischrift im Knopf (`small`) läuft dann auf `rgba(255,255,255,.72)`.
- **Deaktiviert:** `opacity:.4`, `cursor:not-allowed`. Kein eigener Grauton.
- **Wahlreihe:** gleich breite Spalten (`grid-auto-flow:column; grid-auto-columns:1fr`, Abstand `--eng`), zentriert, mit Mono-Beischrift darunter.
- **Übergänge:** 0,12 s auf `border-color`, `background`, `color`. Nichts Längeres, nichts Federndes.

### Hauptaktion
Die einzige gesetzte Schaltfläche im Blatt, im Fuß der Schiene: volle Breite, Fläche `--tinte`, Schrift `--blatt`, Polster `11px 14px`, 13,5 px / 500. Links ein 11-px-Ring in `--akzent` (2 px Strich, oben offen), in der Mitte die Aufschrift, rechts mit `margin-left:auto` ein Mono-Zähler.

- **Rechnet (`data-arbeitet="true"`):** Der Ring dreht sich (900 ms linear) und nimmt `currentColor` an — er steht dann auf dem Balken, der selbst die Akzentfarbe trägt, und wäre darauf unsichtbar. `cursor:progress`, volle Deckkraft.
- **Fortschritt:** `.fortschritt` füllt den Knopf absolut von links (`left:0; top:0; bottom:0; width:%`) in `--akzent`; Ring, Aufschrift und Zähler liegen auf `z-index:1` darüber. Balkenfüllung **und** Prozentzahl laufen gemeinsam von 0 auf 100 durch.
- **Keine CSS-Transition auf der Breite.** Während gerechnet wird, ist der Hauptthread belegt; eine Transition käme nicht voran und der Balken hinge hinter der Zahl her. Die Sprünge sind ohnehin klein (~1,5 %).

### Inputs / Fields
- **Style:** volle Breite, Fläche `--grund`, Rahmen 1 px `--linie`, Radius 4 px, Polster `8px 10px`, 12,5 px. Datums-, Zeit- und Zahlenfelder wechseln auf JetBrains Mono 12 px mit `tabular-nums`.
- **Hover und Fokus:** beide nur `border-color:var(--linie-stark)`; die sichtbare Fokusmarkierung übernimmt der globale `:focus-visible`-Ring. Kein Glühen, kein Farbwechsel der Fläche.
- **Platzhalter:** `--tinte-3`.
- **Entschieden statt gesperrt:** Was nicht mehr wählbar ist, weil eine Entscheidung gefallen ist (Standort bei vorliegendem Datenvertrag), **verschwindet** und wird durch die Angabe plus Herkunftsmarke ersetzt. Ausgegraut hieße „geht gerade nicht"; hier gilt „ist entschieden". `:disabled` bleibt den Fällen vorbehalten, die wirklich nur gerade nicht gehen.

### Regler
Senkrechter Block (`--eng` Abstand) aus Kopfzeile, Schiene und Endenzeile. Kopf: Name links in 12 px `--tinte-2`, Wert rechts in Mono 12 px `--tinte`. Schiene 2 px hoch in `--linie-stark`; Knopf 12 px, kreisrund, `--tinte`. Hover und Fokus legen einen 4-px-Hof aus `--akzent-flor` um den Knopf (`box-shadow`), sonst passiert nichts. Enden in Mono 11 px `--tinte-3`.

**Die Reglernamen-Regel.** Jeder Schieber wird per `aria-labelledby` mit seinem sichtbaren Namen verknüpft, zentral durch `reglerNamenSetzen()` nach jedem Neuzeichnen des Blattes — nicht an jeder der zweiundzwanzig Stellen von Hand. Grund: Die Blätter erzeugen ihre Schiene aus Vorlagen neu, ein handgesetztes Attribut überlebt das nicht. Ein eigenes `aria-label` am Schieber schlägt den gemeinsamen Kopf (nötig bei Paaren wie „von · bis" unter einer Überschrift).

### Navigation (Blattregister)
Vier Blätter als Liste mit 1 px Abstand, jede Zeile ein Raster `20px 1fr auto`: Ziffer · Name · Zustandspunkt. Ruhend transparent mit `--tinte-2`; Hover legt `--senke` unter. Aktiv (`aria-current="true"`): Fläche `--senke`, Rahmen `--linie`, Schrift `--tinte`, und die Ziffer kippt auf `--akzent` mit weißer Schrift — die einzige Stelle, an der der Akzent eine Fläche füllt.

**Die Blattnummer-als-Adresse-Regel.** Ziffer = Tastenkürzel = URL-Anker. Die Ziffer ist deshalb immer sichtbar, auch wenn der Name auf schmalen Schirmen wegfällt; das aktive Blatt behält seinen Namen, damit vier Kreise nicht zum Rätsel werden.

### Wertliste (Signatur)
Die tragende Struktur der Schiene: `dt` links in 12 px `--tinte-2`, `dd` rechts in Mono 13 px / 500 mit `tabular-nums`, Haarlinie zwischen den Zeilen, Polster `6px 0`. Ein Hauptwert je Teil steht auf 19 px mit −0,02 em. Fehlt der Wert, steht „–" in `--tinte-3` / 400 (`dd.leer`) — nie eine leere Zeile, nie eine Null. Geltung: siehe Umbruchregel.

### Rechenzustand (Signatur)
Fünf Werte — keine Rechnung · nicht gerechnet · rechnet · gültig · veraltet — stehen **gleichzeitig an drei Orten**: als Text im Blattkopf der Schiene, als Text in der Statuszeile und als 7-px-Punkt im Register. Der Punkt kodiert: offen = Ring aus `--linie-stark` ohne Füllung; rechnet = `--akzent` mit 900-ms-Puls; gültig = `--tinte` voll; veraltet = `--warn`; keine Rechnung = unsichtbar. Der Zustand ist nie nur eine Farbe und nie nur ein Text.

### Nachweis und Urteil (Signatur)
- **Nachweiszeile:** Raster `1fr auto auto` — Begriff, Sollwert (Mono 11 px `--tinte-3`), Istwert (Mono 13 px / 500). Hält der Wert die Norm, steht er in `--tinte`; hält er sie nicht, steht er in `--warn` **und** durchgestrichen (1 px). Die Unterschreitung ist damit auch ohne Farbwahrnehmung lesbar.
- **Urteilskasten:** ein Satz über die Tragfähigkeit der Zahl. Ruhend Fläche `--grund`, Rahmen `--linie`, 12 px `--tinte-2`, Polster `9px 11px`. Mahnend (`data-mahnt="true"`): Fläche `--warn-flor`, Rahmen verschwindet, Schrift `--warn`.

### Statuszeile (Signatur)
Eine Rasterspur fester Höhe (`--fuss-h` 32 px) über die volle Breite, `align-items:center`, durchgehend Mono 11 px `--tinte-2` mit `tabular-nums`, Feldabstand `--teil`, rechte Gruppe per `margin-left:auto`. Sie trägt Datum, Maßstab, Blatt und Rechenstand; auf schmalen Schirmen fällt die Gruppe `.breit-nur` weg — sie sagt dann das Wichtigste, nicht alles.

**Die Spurregel.** Die Statuszeile bekommt kein senkrechtes Polster. Ihre Höhe ist die Rasterspur, die Zentrierung macht den Rest (gemessen 8,3 px oben / 7,3 px unten). Ein statischer Prüfer liest das als `cramped-padding`; das ist ein Fehlbefund und kein Anlass, `padding-block` nachzurüsten — das würde die Spur sprengen.

### Darstellungsleiste (Signatur)
Über dem Zeichenfeld, waagerecht: die Knopfgruppe links, die Warnung daneben (`max-width:52ch`, 11,5 px, `--warn` / 500 — sie erscheint nur im Warnfall). Knöpfe `padding:4px 9px`, Fläche `--blatt`, Schrift `--tinte-2`, Rahmen `--linie` mit `border-right:none` außer beim letzten — so teilen sich die Nachbarn eine Linie. Erster und letzter Knopf runden nach außen (`--rund`). Gewählt (`aria-pressed="true"`): Fläche und Rahmen `--tinte`, Schrift `--blatt`, und der Folgeknopf zieht seine linke Kante auf `--tinte` nach. Hover hebt nur die Schrift auf `--tinte`. Geltung: siehe Feldwahlregel und Schwereregel.

### Feldmöbel und Anschlusslinie (Signatur)
Im Zeichenfeld liegen Nordpfeil (34 px, oben rechts), Maßstabsleiste (unten links, 5-px-Balken mit Endstrich in `--tinte-2`, Mono-11-px-Text) und der Bedienhinweis (unten rechts) — sonst nichts. Alle drei stehen mit `--block` vom Rand, damit sie auf einer Linie liegen.

**Die Bedienhinweisregel.** Der Satz „Ziehen dreht · rechte Taste oder Umschalt schiebt · Rad zoomt" ist von Nolli übernommen, wörtlich und in derselben Bauform (11 px `--tinte-2` auf `--blatt`, 1 px `--linie`, Polster `3px 8px`, Radius 2 px) — wer zwischen den Werkzeugen der Kette wechselt, soll nicht umlernen. Er entfällt bei `pointer: coarse` und unter 720 px: Dort nennt er Maus, rechte Taste und Rad, die es nicht gibt, und überdeckt bei 366 px Feldbreite die Maßstabsleiste. **Ein Hinweis, der im Weg steht und das Falsche sagt, ist schlechter als keiner.** Formuliert als Ausblenden bei grobem Zeiger, nicht als Einblenden bei feinem: Sonst verschwindet er dort, wo kein Zeiger gemeldet wird. Eine Anschlusslinie hängt eine Zahl an ihren Ort im Modell: SVG-Linie plus Schild auf `--blatt` mit 1 px `--tinte`, Radius 2 px, `--heben-klein`. Die Benennung des Themas steht dabei leiser als der Messwert.

## Do's and Don'ts

### Do:
- **Do** jede Messstelle in JetBrains Mono mit `font-variant-numeric:tabular-nums` setzen — auch in SVG-Text.
- **Do** Wertzeilen als `flex-wrap:wrap` mit `margin-left:auto` am Wert bauen; die Beschriftung bekommt `min-width:0`, der Wert `white-space:nowrap`.
- **Do** jedem überlaufenden Laufbereich eine sticky Ausblendkante (28 px, `margin-top:-28px`) geben und sie an `scroll`, `ResizeObserver` und `toggle` nachführen.
- **Do** neue Farbwerte gegen ihren tatsächlichen Untergrund rechnen und mindestens 4,5 : 1 halten; `--tinte-3` ist der Boden und bleibt, wo er ist.
- **Do** 11 px als Boden für Bedientext und 12 px für Fließtext und Daten einhalten.
- **Do** Zustände in Tinte setzen: Umkehr der Fläche, nicht ein hellerer Grauton, und nie nur beim Überfahren sichtbar.
- **Do** die gewählte Fassung einer waagerecht laufenden Leiste in den Blick scrollen; eine Auswahl, die außerhalb des Sichtbaren steht, ist keine.
- **Do** eine nicht gerechnete Zahl als solche kennzeichnen — runden, eine leise Herkunftszeile darunter, und im Urteilskasten ein Satz, der Rechnung von Annahme trennt. Seit dem Wegfall von PV steht keine geschätzte Zahl mehr im Werkzeug; angenommen sind nur noch Bauhöhen, und das sagt die Höhenherkunft.
- **Do** einen Rechenzustand an allen drei Orten gleichzeitig führen: Blattkopf, Statuszeile, Punkt im Register.
- **Do** Schieber über `reglerNamenSetzen()` mit ihrem sichtbaren Namen verknüpfen, nach jedem Neuzeichnen.
- **Do** bei Platznot zuerst Ränder und Spaltenbreiten schrumpfen, dann die Struktur umbrechen.

### Don't:
- **Don't** `justify-content:space-between` auf einer Zeile verwenden, deren Wert `nowrap` trägt — die Beschriftung fällt auf Nullbreite und überschreibt den Wert.
- **Don't** einen überlaufenden Bereich hart abschneiden; ein Schnitt auf halber Glyphenhöhe liest sich als Darstellungsfehler.
- **Don't** `--tinte-3` auf ein „schöneres" Grau zurücksetzen. Der Wert ist gegen `--senke` und `--blatt` gerechnet, nicht gewählt.
- **Don't** die Messrampe in der Oberfläche verwenden oder den Akzent auf einen Messwert legen.
- **Don't** einen zweiten Akzent einführen. Sonne, aktives Blatt, Auswahl, Ring — mehr Rollen gibt es nicht.
- **Don't** das Zeichenfeld im dunklen Schema mit einziehen; es führt seine eigene helle Leiter, weil der Schattenwurf der Gegenstand ist.
- **Don't** Hell als eigenen `data-schema`-Wert markieren. Hell ist die Abwesenheit des Attributs.
- **Don't** eine CSS-Transition auf die Fortschrittsbreite legen; der Hauptthread ist beim Rechnen belegt.
- **Don't** Tiefe durch Schatten erzeugen. Außer dem Blatt auf der Unterlage (`--heben`) und dem, was auf dem Blatt liegt (`--heben-klein`), ist alles flach.
- **Don't** etwas ausgrauen, das entschieden und nicht bloß gerade gesperrt ist — solche Felder verschwinden und werden durch die Angabe mit ihrer Herkunft ersetzt.
- **Don't** Versalien außerhalb der 11-px-Labelrolle einsetzen.
- **Don't** `min-height` auf ein Rasterelement der Fläche setzen; es schiebt sich über seinen Nachbarn.
- **Don't** einen Hinweis danebenstellen, der nichts verlangt. Er wird Tapete und nimmt der echten Warnung ihre Wirkung.
- **Don't** eine Beschriftung gegen eine angekündigte Liste prüfen statt gegen das Geladene; ein Unterschied, dessen Gegenstück fehlt, ist keiner.
- **Don't** einen Umschalter zeigen, der nur einen Eintrag hat. Dann steht dort ein Satz.
- **Don't** eine Fähigkeit nachrüsten, ohne zu prüfen, ob die Bibliothek sie schon hat — OrbitControls schiebt bei gedrückter Umschalttaste von sich aus, und das Nachrüsten hob es auf.
