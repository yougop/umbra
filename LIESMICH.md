# Umbra

Solar- und Umweltanalyse für Gebäudemodelle im Browser. Nachfolger von
`nai-env.html`.

**Umbra ist die dritte Station einer Kette:** Urban AI Skills liefert die
Methode, Nolli zieht den maßstäblichen Rahmen über den Bestand und zeichnet
den Gebäudeschatten bereits, aber mit einer **festen Kunstsonne** (Nordwest,
48,8° hoch, 0,875 × Bauhöhe, für jeden Tag des Jahres dieselbe) – Umbra rechnet
denselben Schatten mit der **echten** Sonne für Ort und Zeitpunkt, in drei
Dimensionen, und macht daraus Besonnungsdauer und Einstrahlung.

## Starten

Umbra lädt seine Modelle per `fetch`. Über `file://` geht das nicht – es
braucht einen Server:

```bash
cd umbra
python3 -m http.server 8777
# http://127.0.0.1:8777/umbra.html
```

## Aufbau

```
umbra.html          alles: Aufbau, Gestalt, Rechenkern (eine Datei, kein Build)
schrift/            Satoshi 400/500/700, JetBrains Mono – dieselben Schnitte wie Nolli
modelle/            das Startpaket in Nollis eigener Ordnung (Vertrag v2), lädt beim Start
  frame.json                         Datenvertrag – wird zuerst gelesen
  model.obj                          338 Gebäude und 286 Gebäudeteile
  images/figure_ground_bare.webp     Voreinstellung, 4096 × 3072 px
  images/top_view_bare.webp          Textur
  images/line_bare.webp
  data/trees.json                    1.781 Bäume, aufgelöst: crown_m + measured
  hcu-demo/                      die alten HCU-Dateien, nicht mehr im Startweg
pruefe-lieferung.sh liest aus umbra.html, was auszuliefern ist
pruefe-stand.sh     ist der ausgelieferte Stand dieser?
pruefe-sprache.mjs  Rundgang auf Englisch, meldet deutsche Reste (npm install vorher)
package.json        nur für die Prüfskripte (puppeteer-core); Umbra selbst baut nichts
README.md           englische Beschreibung fürs Repository
PRODUCT.md          Produktwahrheit (Impeccable)
DESIGN.md           das Designsystem
.impeccable/        Richtungsvertrag, Prüfbilder, DESIGN.md-Sidecar
```

Die Aufsicht liegt als verlustfreies WebP, nicht als PNG: pixelgleich, aber
ein Fünftel der Größe – und der Bildoptimierer des Hosters rechnete PNG beim
Ausliefern auf 1600 × 1200 herunter. Umbra prüft die gelieferten Bildpunkte
gegen den Datenvertrag und warnte daraufhin zu Recht, das Paket passe nicht
zusammen. WebP lässt der Optimierer unangetastet.

## Ausgabe

Der Abschnitt „Ausgabe" in der Schiene gibt das Gezeigte weiter: als PNG, oder
als WebM über den Tagesverlauf (von Auf- bis Untergang) und über das Jahr.

Ausgegeben wird **genau der Ausschnitt des Zeichenfelds** plus eine
Fußleiste: oben die Zeichenerklärung des Blattes — Farbproben oder Messrampe
mit ihren Enden —, darunter Ort, Zeitpunkt, Sonnenstand, Maßstab und
Blattnummer. Die Zeichnung ist pixelgleich mit dem Fenster (nachgemessen:
mittlere Abweichung 0,09 von 255, reines Kantenglättungsrauschen) und füllt
über 90 % des Bildes.

Was fehlt, sind die Schienen ringsum; für ein Vollbild des Fensters ist das
Aufnahmewerkzeug des Systems das richtige.

Der Film wird Bild für Bild angefordert (`captureStream(0)` plus
`requestFrame()`), nicht in Echtzeit mitgeschnitten. `MediaRecorder` stempelt
trotzdem nach der Wanduhr: Dauert das Rendern länger als das Bildbudget, wird
der Film länger und läuft langsamer. Das Werkzeug meldet deshalb die
**gemessene** Dauer und nennt den Grund, wenn sie abweicht.

## Auslieferung

Das Kachelbild auf der Startseite ist **Volkers eigene Aufnahme**, von ihm
ausgewählt und hineinskaliert statt beschnitten. Es liegt nicht hier im
Projekt und wird nicht von hier ersetzt. Die fünf Inhaltsbilder in `bilder/`
sind dagegen die ausgelieferten.

`./pruefe-lieferung.sh` nennt in seiner ersten Zeile, **ab wann** der Stand
gilt. Die Website-Session misst daran, ob eine Bildschirmaufnahme den
aktuellen Zustand zeigt — nach der Änderung des Zeichengrunds war das die
Frage, an der zwei Aufnahmen sonst nur mühsam zu unterscheiden gewesen wären.


Live unter `zinssmeister.info/app/umbra/`, gepflegt von der Website-Session.
Zwei Prüfungen, die verschiedene Fragen stellen:

- `./pruefe-lieferung.sh` — was auszuliefern ist. Liest die Verweise aus
  `umbra.html`, prüft ihre Existenz, gibt Prüfsummen aus und listet, was im
  Ordner liegt, ohne gebraucht zu werden. Diese Ausgabe geht an die
  Website-Session; eine von Hand geschriebene Liste vergaß einmal die vier
  Schriftdateien, und Umbra lief live in Systemschrift.
- `~/projects/zinssmeister_studio/werkzeug/pruefe-live-umbra.mjs` — ob das
  Ausgelieferte taugt. Ruft die Live-Adresse auf und fragt das Werkzeug
  selbst: Paketprüfung leer? Texturmaße wie im Datenvertrag? Schriftschnitte
  wirklich *geladen*, nicht nur angekommen? Kam eine Teilressource als HTML
  zurück? Rückgabewert 0 oder 1. Liegt `puppeteer-core` nicht daneben, muss
  `PUPPETEER_PFAD` auf dessen Verzeichnis zeigen.

  Es liegt bewusst **nicht** hier, sondern beim Werkzeugkasten der
  Website-Session: Es prüft keine Projektdatei, sondern eine Auslieferung, und
  gehört damit zu dem, der hochlädt. Dort steht es neben
  `pruefe-live-nolli.mjs`, das dasselbe für Nolli tut.

Die erste prüft, ob ankommt, was hochgeladen wurde; die zweite, ob ankommt,
was funktioniert. Der Bildoptimierer des Hosters lieferte eine Textur mit
Status 200 und richtigem Content-Type aus, die er auf ein Viertel
heruntergerechnet hatte — nur die zweite Frage findet so etwas.

## Das Nolli-Paket

Ein Paket wird **als Ganzes** geladen – als ZIP oder als ausgepackter Ordner
(`Nolli-Paket laden` bzw. `Ordner statt ZIP`). Das ZIP liest Umbra ohne
Bibliothek, über `DecompressionStream('deflate-raw')` und das
Zentralverzeichnis. Zugeordnet wird nach Endung und Lage, nicht nach exaktem
Namen: Die einzige `.json` ist der Vertrag, die einzige `.obj` das Modell, die
Bilder sind die Darstellungen.

Der **Datenvertrag wird zuerst gelesen** – er sagt, wo das Modell auf der Erde
steht, und damit steht der Sonnenstand fest, bevor die erste Fläche geladen
ist. Eine Adresssuche braucht Umbra dafür nicht. Deshalb hat er auch keinen
eigenen Ladeknopf mehr: Er kommt aus dem Paket. Modell und Aufsichts-Textur
behalten ihren, damit jemand sein eigenes Modell darüberlegen kann.

Die **Aufsicht** liegt als Textur unter dem Modell, genau auf dem Rahmen des
Vertrags: Nordwestecke des Bildes auf die Nordwestecke des Rahmens, Kantenlänge
aus Pixelzahl × Meter-je-Pixel. Damit bringt Nolli Wasser, Grün, Straßen und
Plätze selbst mit, und Umbra zeichnet den Ort nicht ein zweites Mal.

### Darstellungen

Ein Paket bringt mehrere Texturen im selben Rahmen mit. Die Leiste **über dem
Zeichenfeld** schaltet zwischen ihnen um – dieselbe Bauform wie bei Nolli, ein
segmentierter Umschalter. Sie erscheint erst ab zwei Darstellungen; bei einer
einzigen stünde dort ein Umschalter ohne Auswahl, und in der Schiene steht
stattdessen ein Satz, der sagt, dass es die Wahl gäbe.

Das Startpaket führt drei: **Schwarzplan** (Voreinstellung auf jedem Blatt),
Linie und Textur. Der Schwarzplan ist die Darstellung, in der ein Städtebauer
zu Hause ist — Figur und Grund, sonst nichts, und der Schattenwurf legt sich
darauf ohne Konkurrenz. Die Datentiefe ist am 16.09.2026 ganz herausgenommen
worden; ein volles Nolli-Paket bringt sie weiter mit. Fehlt der Schwarzplan in einem Paket, fällt Umbra auf die
`_grund`-Aufsicht zurück. Im engen Fenster läuft die Leiste waagerecht, und die
gewählte Fassung wird in den Blick gescrollt – eine Leiste, die eine Auswahl
anzeigt, die niemand sieht, wäre keine.

**Die Beschriftung nennt den Unterschied, nicht die Herkunft.** Die
Grund-Fassung heißt schlicht „Aufsicht"; „ohne Bauten" kommt nur dazu, wenn im
selben Paket auch die Fassung *mit* Bauten liegt – sonst unterscheidet der
Zusatz nichts von nichts. Maßgeblich ist dabei, was wirklich geladen werden
kann, nicht was der Vertrag aufzählt: Das Startpaket führt den Vertrag des
vollen Nolli-Pakets, liefert aber nur einen Teil der Bilder.

Neben der Leiste steht genau ein Fall: die Fassung mit **eingebranntem
Schatten** aus Nollis Kunstsonne. Man kann ihn für den gerechneten halten und
liest dann eine Verschattung, die niemand gerechnet hat; das steht in
Warnfarbe. Ein leiser Hinweis auf den mitgezeichneten Grundriss stand hier
einmal daneben und ist entfallen – ein Satz, der bei jeder zweiten Fassung
dasteht und nichts verlangt, ist Tapete und nimmt der Warnung die Wirkung mit.

Die `_grund`-Fassung ist die Aufsicht ohne Gebäude. Das ist wesentlich, nicht
kosmetisch: Die gewöhnliche Aufsicht enthält die Gebäude samt ihrer gemalten
Schatten aus Nollis fester Kunstsonne, und läge sie unter dem 3D-Modell, würfe
jedes Haus zwei Schatten in zwei Richtungen.

### Bäume

Zuschaltbar neben der Darstellungsleiste, mit eigenem Knopf statt eigenem
Segment: Bäume treten zu jeder Darstellung hinzu, statt eine andere abzulösen.
Sie stehen in jeder Darstellung und auf jedem Blatt. Vorgabe ist **aus** — sie
sind Zusatz, nicht Bestand des Nachweises.

Die Krone ist ein **Ikosaeder**, grün und undurchsichtig. Undurchsichtig,
obwohl eine echte Krone Licht durchlässt: Sie ist ein Ortszeichen, kein
Hindernis. Eine halbdurchsichtige Kugel sähe aus wie ein gerechneter Durchlass
und wäre eine Behauptung über eine Größe, die hier noch niemand gesetzt hat.

**Sie gehen in keine Rechnung ein** — weder in den Besonnungsnachweis noch in
die Einstrahlung. Im Bild werfen sie trotzdem Schatten, denn sie stehen im
Modell. Was man sieht, ist damit mehr als was gerechnet wird, und genau das
steht als Warnung neben dem Schalter, solange sie an sind.

Drei Größen, drei Quellen: Der **Ort** ist gemessen. Der **Kronendurchmesser**
ist gemessen, wo `diameter_crown` dasteht (775 von 1.781), sonst pauschal
**6,0 m**. Die **Höhe** ist immer angenommen: Kronenansatz 3,0 m, Mittelpunkt
einen Radius darüber.

Die 6,0 m sind nicht der Median der gemessenen Kronen (der ist 3,0 m) und auch
keine Aufrundung, sondern eine andere Grundgesamtheit. Die Bäume *mit* Maß
sind das Hamburger Straßenbaumkataster — 774 von 775 tragen auch einen
Stammumfang, alle ein Pflanzjahr. Die *ohne* sind von Hand kartiert: Parks,
Höfe, Privatgrund, nur 7 von 1.006 mit Stammumfang. Straßenbäume sind jung und
schmal; ihren Median auf Parkbäume anzuwenden hieße, von der einen Gruppe auf
die andere zu schließen — und die Pauschale gilt gerade der anderen.

6,0 m ist zugleich der Wert, mit dem **Nolli** dieselben Bäume in seine
Aufsicht zeichnet. Dieselben Daten dürfen nicht zwei verschiedene Bäume
ergeben. Der Fehler — Umbras Kugel halb so breit wie Nollis Kreis darunter,
bei 1.006 von 1.781 Bäumen — kam aus der Nolli-Session, nicht von hier.

### Datenvertrag v2

Nolli schreibt seit dem 14.10.2026 den Vertrag v2: englische Feld-, Datei-,
OBJ- und DXF-Namen (`model.obj`, `data/bodies.json`,
`images/figure_ground_bare.webp`, `caveats`, `grid.central_meridian` …),
`frame.json` beginnt mit `contract: "nolli", contract_version: 2`. Umbra liest
beide Fassungen: `nolliPaketV1` führt ein v2-Paket auf die v1-Namen zurück,
mit denen Umbra intern rechnet. Die Tabelle `NOLLI_V2` ist eine Abschrift aus
Nollis `werkzeug/src/lib/vertrag.ts` und wird **nicht von Hand geändert**,
sondern dort erzeugt (`node pruefung/vertrag.mjs --tabelle`) und gegen dieses
`umbra.html` geprüft. Angezeigt werden die Namen aus dem Paket, nicht die
zurückgeführten: Wer `model.obj` lädt, liest `model.obj`.

Bringt das Paket Gelände mit (absolute Z, Körper `terrain` am Ende des OBJ),
setzt `nolliObjEben` jeden Körper auf null und lässt das Gelände weg. Der Hang
als Schattenwerfer ist damit bewusst offen; der Vorbehalt „Gelände auf Platte
gelegt" sagt es.

### Das Startpaket

Beim Start liegt ein mitgeliefertes Paket bereit – HafenCity, Hamburg. Das sagt
Umbra auch: Der erste Absatz im Teil „Modell" nennt es beim Namen, mit Datum und
Ort, und dass ein eigenes Paket es vollständig ersetzt. Geholt werden beim Start
nur drei Dateien (Vertrag, Modell, die voreingestellte Textur); die übrigen
Darstellungen erst, wenn jemand sie wählt.

Ein frisches Paket holen: `zinssmeister.info/app/nolli/` → „HafenCity" (lädt aus
dem Beispielgebiet, keine Overpass-Abfrage) → Schritt 3 „Ausgeben" → „Paket".
Das ZIP auspacken, den Inhalt nach `modelle/` legen und die Dateinamen in
`STARTPAKET_DATEIEN` eintragen – oder einfach das ZIP im Werkzeug laden.

Seit dem 14.10.2026 liegt das Startpaket im Datenvertrag v2: erzeugt mit Nolli
am selben Tag, HafenCity ohne Gelände, nur die sechs Dateien, die Umbra beim
Start braucht (2,1 MB statt 3,6 MB). Damit läuft der v2-Leser bei jedem Start
mit, und der Vorbehalt „Gelände eben“ steht jetzt auch im Startpaket. Die
Kennwerte sind dieselben wie vorher (338 Gebäude, 116 / 129 / 93, 192 ha). Die
Bilder weichen an 3–4 % der Pixel ab, ausschließlich an Konturen (im Mittel
0,12 von 255): andere Kantenglättung, weil das alte Paket in einem Chrome mit
Grafikkarte entstand und das neue mit SwiftShader. Das v1-Paket vom
17.09.2026 liegt als Prüfmuster unter `~/projects/archiv/umbra-startpaket-v1-2026-09-17/`
– damit bleibt der v1-Pfad prüfbar.

## Was das Modell nicht kann

Umbra liest die Vorbehalte **aus dem Datenvertrag**, nicht aus dem Quelltext.
Führt ein Vertrag das Feld `vorbehalte` – auch leer –, ist es maßgeblich; fehlt
es, stammt das Paket aus der Zeit vor der Angabe und die alten Mängel werden
angenommen. Im aktuellen Paket steht dort:

- **Dächer waagerecht.** Jeder Baukörper trägt genau eine Höhe und ein
  waagerechtes Dach; Neigung, First und gestaffelte Traufhöhen kennt das Modell
  nicht, weil OpenStreetMap den Umriss als eine Fläche führt. Für den
  Schattenwurf ist das nachrangig — es ist die Grenze des
  Modells – gerechnet wird auf einer waagerechten Fläche, wo in Wirklichkeit
  zwei geneigte liegen.

Dazu die Höhenherkunft. Der Vertrag nennt sie seit dem 16.09.2026 **zweimal**,
und Umbra zeigt die vorsichtigere: **116 Gebäude** gemessen, 129 aus der
Geschosszahl, 93 mit acht Metern angenommen — 28 % der Gebäude, aber **44 % der
Grundfläche**.

Der Grund für die zwei Lesarten: Nolli nimmt `building` und `building:part` in
dieselbe Schublade. Von den 624 Körpern der HafenCity sind 338 Gebäude und 286
Gebäudeteile, und bei 96 % der Teile liegt der Mittelpunkt in einem
Gebäudegrundriss. Für die Verschattung ist das richtig — was extrudiert wird,
wirft Schatten, und die Teile stehen im zweiten Satz. Für die Aufstellung wäre
es **beschönigend**: Teile tragen fast immer ein `height`, über alle 624 stünden
nur 29 % der Fläche auf dem Notwert statt 44 %.

*Von zwei richtigen Zahlen gehört die vorsichtigere ins Blatt, wenn die andere
einen Nachweis leichter bestehen lässt, als er dürfte.*

Veröffentlichen heißt: diese elf Einträge auf den Server legen. Kein npm,
kein Buildschritt, keine Abhängigkeit außer three.js über jsDelivr.

## Die fünf Blätter

| # | Blatt | Was es rechnet |
|---|---|---|
| 1 | Sonnenstand | Tagesbahn, Schattenwurf, Besonnungsnachweis an einem geklickten Punkt gegen DIN 5034-1 |
| 2 | Sonnenbahn | Tagesbahnen der Solstitien und der Tagundnachtgleiche, Analemmen zu jeder vollen Stunde |
| 3 | **Gebäudehülle** | Direkte Einstrahlung auf Fassaden und Dächer, je Teildreieck, Zeitpunkt oder Zeitraum, mit Verschattung |
| 4 | **Stadtraum** | Was der Boden zwischen den Häusern an einem Hitzetag abbekommt: direkte Sonne plus Diffusstrahlung nach Himmelsanteil, mit Bäumen. Stundenwerte von Open-Meteo |
| 5 | Windexposition | Wie frei der Weg in die Richtungen ist, aus denen der Wind hier wirklich kommt — gewichtet mit der gemessenen Windrose. **Kein CFD** |

Gestrichen sind „Wetter" (eine Live-Meldung trägt zur Frage nach Schatten und
Ertrag nichts bei), „PV-Potenzial" (Google rechnet Dachpotenziale längst; die
Frage ist eher kommerziell als städtebaulich) und „Fläche prüfen" (es hat nie
richtig Sinn ergeben). Was bleibt, ist durchgehend gerechnet.

Die Ziffern 1–5 blättern. Die Blattnummer steht im Ankerteil der Adresse,
zusammen mit Zeitpunkt und Ort – ein Zustand ist damit verlinkbar.

## Bedienung

- **Ziffern 1–5** blättern zwischen den Blättern, **Esc** hebt Prüfpunkt und Reihe auf.
- **Datum und Uhrzeit** werden deutsch eingegeben und deutsch angezeigt:
  `TT.MM.JJJJ` und `HH:MM`. Bewusst keine nativen `date`/`time`-Felder – die
  zeichnen sich im Gebietsschema des Browsers und schreiben bei einem
  englischen Rechner `03/21/2026` und `03:00 PM` neben ein Schriftfeld, das
  `21.03.2026` und `15:00 MEZ` sagt. Eine unlesbare Eingabe wird abgewiesen,
  nicht stillschweigend umgedeutet.
- **Die Maßkette** unten ist die Zeitachse: der besonnte Abschnitt ist stark
  gezeichnet, die Nacht dünn. Ziehen verstellt die Uhrzeit.
- **Der Zustand steht in der Adresse** – Blatt, Zeitpunkt und Ort. Ein Link
  führt zurück auf genau dasselbe Bild.
- **Die Ansicht** wird mit der Maus bedient, wie in Nollis Raumansicht:
  *Ziehen dreht · rechte Taste oder Umschalt schiebt · Rad zoomt*. Der Satz
  steht unten rechts im Zeichenfeld und entfällt auf Geräten ohne feinen
  Zeiger. Umschalt schiebt ohne Zutun — OrbitControls behandelt Umschalt,
  Strg und Meta selbst als Schiebe-Modifikator.

## Sprache

Deutsch und Englisch, umschaltbar oben rechts neben dem Schemaknopf („DE | EN").
Gemerkt wird die Wahl unter `umbra.sprache` im Browser, sonst entscheidet die
Browsersprache; `<html lang>` wechselt mit. Zahlen, Daten und Uhrzeiten stehen
im Gebietsschema der Sprache (`de-DE`, `en-GB`: 21/03/2026, 24-Stunden-Uhr);
die Datumseingabe nimmt Punkt und Schrägstrich in beiden Sprachen.

Die Texte stehen in zwei Wörterbüchern derselben Form im Abschnitt SPRACHE von
`umbra.html` (`const de`, `const en`), wie in Nolli. Ohne TypeScript prüft
`woerterPruefen()` beim Laden, dass beide dieselben Schlüssel derselben Art
tragen, und meldet Abweichungen in der Konsole. Statischer Text im Aufbau
trägt `data-t`, `data-t-title`, `data-t-aria` oder `data-t-platzhalter`. Ein
Wechsel lädt nicht neu, sondern zeichnet alles neu, was Text trägt – ein
eigenes Paket und gesetzte Marker bleiben.

Fachbegriffe wie in Nolli: *Frame*, *Removed*, *Kept*, *Site area*,
*data contract*, *sheet*. Die Darstellungen heißen wie dort (*Figure-ground*,
*Line*, *White model* …); nur `modellaufsicht` heißt in Umbra auf beiden
Seiten *Textur*/*Texture*, weil sie neben den Zeichnungen das einzige Bild ist.

`node pruefe-sprache.mjs [ordner]` geht die Oberfläche auf Englisch durch –
jedes Blatt, beide Ansichten, Bäume, Marker, Nachweis, die Reihe – sammelt
Text, `title`, `aria-label` und `placeholder` und meldet deutsche Reste.
Danach einmal Deutsch und zurück. Ausgang 0 heißt sauber.

## Rechenausschnitt und Aufwand

**Vorgabe ist seit dem 16.09.2026 das ganze geladene Gebiet** — bei der
HafenCity 1.600 m. Wer ein Paket lädt, meint zunächst das Paket. Der Regler
reicht so weit, wie das Modell groß ist.

Das ist zugleich die teuerste Einstellung, deshalb steht unter den Reglern,
was sie kostet — als **Vergleich, nicht als Prophezeiung**: die Zahl der
Strahlprüfungen und, sobald einer gelaufen ist, dessen gemessene Dauer für
seine Zahl. Eine Sekundenangabe wäre ein Versprechen über fremde Hardware.

*Gemessen* auf diesem Modell: Blatt 3 bei der Vorgabe (9 m, 1.600 m) sind
660.493 Teildreiecke × 11 Sonnenstände = 7,3 Mio. Prüfungen in **81,9 s**.
Blatt 4 bei 8 m Raster 3,5 Mio.

Die Vorabschätzung für Blatt 3 hängt an einem **gemessenen** Teiler: 2.198.014 m²
Modellfläche ergaben bei 9 m Kantenlänge 660.493 Teildreiecke, also 0,0411 · k²
je Stück. Die erste Fassung rechnete mit der Fläche eines Dreiecks mit Kante k
(0,5 · k²) und lag damit **zwölffach zu niedrig** — bei der Vorgabe kam keine
Warnung, und der Lauf brauchte trotzdem anderthalb Minuten. Das rekursive
Vierteln unterschreitet die Zielkante um mehr als eine Stufe.

## Blatt 4 · Stadtraum

**Was es rechnet.** Für jede Bodenzelle im Rechenausschnitt: die direkte
Sonneneinstrahlung jeder Stunde, in der die Sonne von dort aus sichtbar ist,
plus die Diffusstrahlung nach dem Anteil des sichtbaren Himmels. Summe über
einen Tag, in kWh/m². Die Stundenwerte — direkt und diffus getrennt — kommen
von **Open-Meteo**, die Geometrie aus dem Modell.

**Warum ein Wetterdienst.** Umbra rechnet sonst nur direkte Strahlung; das
steht auf Blatt 3 als Vorbehalt. Erst die Aufteilung macht die zweite Hälfte
rechenbar. *Gemessen* am heißesten Hamburger Tag 2025 (2. Juli, 34,5 °C):
5,9 kWh/m² direkt gegen 1,5 diffus, also 20 % diffus. **In der Sonne ist das
eine Korrektur, im Schatten ist es alles, was ankommt** — und genau dort liegt
die Frage, welcher Schatten taugt.

**Der Tag** ist voreingestellt der heißeste des letzten vollen Sommers an
diesem Ort, aus dem Archiv geholt. Ein Hitzeblatt für einen beliebigen Tag
beantwortet die Frage nicht.

**Zwei Darstellungen, gegenläufig.** Die *Strahlungslast* zeigt, was tagsüber
ankommt. Der *Himmelsanteil* zeigt, wie viel Himmel ein Punkt sieht — tagsüber
lässt viel Himmel Diffusstrahlung herein, nachts lässt er Wärme heraus.
Dieselbe Zahl, zwei Vorzeichen. Eine Karte, die nur den Tag zeigt, hat die
Nacht falsch, und die Nacht ist es, in der Hitze gefährlich wird.

**Bäume gehen ein, wenn sie zugeschaltet sind** — dämpfend, nicht verstellend,
mit dem Regler *Kronendurchlass*. Vorgabe 25 %, **angenommen und nicht
belegt**; ein niedrigerer Wert schriebe den Bäumen mehr Kühlung zu, als sie
vielleicht leisten, deshalb steht die Vorgabe auf der vorsichtigen Seite. Beim
Himmelsanteil zählen die Kronen *nicht* mit: Nachts verstellt eine Krone den
Himmel kaum. *Gemessen* über 500 m bei 10 m Raster: 5,31 kWh/m² im Mittel ohne
Bäume, 5,05 mit — knapp 5 % weniger.

**Zwei Mischungen, zwei Fragen.** *Multiplizierend* (Vorgabe) lässt den Boden
durchscheinen — Straßen, Wasser und Kanten bleiben lesbar, und man sieht, **wo**
eine Last liegt. *Gemessen* an der Helligkeitsstreuung im Zeichenfeld: 53,7
gegen 41,6 bei deckender Mischung, also knapp ein Drittel mehr Struktur.

Der Preis steht daneben und ist kein kleiner: Die gezeigte Farbe ist dann das
**Produkt** aus Rampenfarbe und Untergrund und damit **dunkler als die
Legende** — über hellem Pflaster kaum, über dunklem Wasser erheblich. Wer
einen Wert ablesen will, stellt auf *Deckend*; dort ist die Farbe genau die
der Rampe. Die ausgegebene Legende sagt es mit.

**Zellen unter einem Dach werden gezeichnet, aber nicht gezählt.** Geprüft wird
von oben herab: Liegt das Erste, was der Strahl trifft, höher als ein halber
Meter, steht dort ein Haus. (Von unten nach oben zu prüfen scheitert, weil die
Dachfläche dann mit der Rückseite getroffen wird.)

Zuerst wurden sie übersprungen — dann franste die Karte aus: Bei 8 m Raster
fällt jede Zelle weg, deren Mitte unter einem Dach liegt, und das ist ein Ring,
der breiter ist als das Haus. Gezählt werden sie weiterhin nicht, denn unter
einem Dach kommt keine Sonne an und diese Nullen zögen den Mittelwert nach
unten. **Zeichnen und Zählen sind zwei Entscheidungen, nicht eine.**

**Was es nicht rechnet.** Keine Temperatur. Luftwärme, Wind in
Aufenthaltshöhe und die in Belägen gespeicherte Wärme fehlen — und gerade die
treibt die nächtliche Wärmeinsel. Der Himmelsanteil ist dafür ein
Stellvertreter, kein Ersatz. Das Blatt heißt deshalb *Strahlungslast* und
nicht *Klima*.

## Blatt 5 · Windexposition

**Was es rechnet.** Für jede Bodenzelle den **freien Anlauf** in sechzehn
Richtungen, auf 1,5 m über Grund, gewichtet mit der gemessenen Windrose eines
vollen Jahres von Open-Meteo. 100 % heißt: in allen Richtungen, aus denen der
Wind kommt, über die eingestellte Anlauflänge frei.

**Gewichtet nach Energie (v³), nicht nach Häufigkeit** — für die Frage, wo es
zieht, zählt die starke Stunde. *Gemessen*, Hamburg 2024: WSW, W und SW tragen
**54,8 % der Windenergie** bei 35,5 % der Stunden.

*Geprüft*, ob die Rose das Ergebnis wirklich formt und nicht nur Offenheit
gemessen wird — unabhängig nachgerechnet an 700 Punkten:

| | Mittel |
|---|---|
| echte Rose | 0,637 |
| gleichverteilte Rose | 0,634 |

**Die Rose ändert nicht das Mittel, sondern nur, wo die Exposition liegt.** Je
Punkt weichen 235 von 700 um mehr als 0,05 ab, im Median um 0,026, im größten
Fall um 0,244. Das ist der richtige Befund — und er ist schwächer als der, den
ich zuerst gemeldet hatte: Die erste Prüfung nannte 0,764 gegen 0,634, aber
ihre Testrose summierte sich auf 1,20 statt 1,00. Der Unterschied war fast ganz
dieser Normierungsfehler, ein Fehler in der Prüfung und nicht im Werkzeug.
*Eine Gewichtung umzuverteilen erhöht keine Summe.*

**Der volle Anlauf ist eine Festlegung, keine Messung** (Vorgabe 200 m). Er
bestimmt, wie streng die Karte ist.

**Die Aufsicht ist auf diesem Blatt gesperrt**, ebenso auf Blatt 4: Sie ist
selbst farbig, und eine Messrampe darüber ergibt eine dritte Farbe, die keine
von beiden erklärt. Zugelassen sind **Schwarzplan** (Vorgabe wie überall) und
**Linie**, der dünnste Grund, wenn die Rampe ganz unverfälscht kommen soll. Die gesperrten erscheinen gar nicht erst —
ein Knopf, der da ist und nicht geht, erklärt sich nicht; ein Knopf, der fehlt,
wirft die Frage auf, und die beantwortet der Satz daneben.

**Die Rampe ist fest und steht nicht zur Wahl: Gelb → Pink → Blau**, also
windstill → mittel → stark. Das ist die Ladybug-Rampe rückwärts, und es ist
die dritte Fassung.

Zuerst Blau für windstill: Dann war die ruhige Hälfte des Bildes die dunkelste,
und das Blatt betonte, wo nichts ist. Dann Weiß für windstill, damit die Karte
dort unberührt bleibt — elegant, aber unlesbar: **Die geschützten Stellen sind
der eigentliche Fund, und sie waren gar nicht markiert.** *Gemessen* liegen
43,7 % der Fläche über 80 % Exposition und 18,4 % unter 20 %; das Bild bestand
also fast nur aus dem oberen Ende.

Die Weglassregel gilt hier deshalb nicht: Auf diesem Blatt sind **beide** Enden
ein Befund — der Windschatten wie die Zugluft. Gelb für Windstille liest sich
zudem richtig herum: warme stehende Luft gegen kalten Zug. Zur Probe: Die
gelben Streifen liegen auf den Nordostseiten der Baukörper, also im Lee des
WSW-Windes.

Beide Enden tragen ihre Bedeutung in der Beschriftung **und in der
ausgegebenen Legende**, weil „0 %" und „100 %" allein nicht sagen, welches
Ende der Wind ist. Genau diese Frage kam beim ersten Ansehen.

Ob viel Wind gut oder schlecht ist, sagt das Blatt **nicht**: Im Hitzesommer
ist er willkommen, im Januar nicht. Die Karte misst, sie urteilt nicht.

### Warum kein CFD

Die drei einfachen Wege sind Fallen. **Lattice-Boltzmann in 2D** läuft flüssig
im Browser, ist aber flach — er kennt den Fallwind an hohen Fassaden nicht, und
genau der macht die Beschwerden am Fuß von Hochhäusern. **Potentialströmung**
kennt keine Ablösung und keinen Nachlauf, wäre also systematisch zu ruhig.
**Echtes 3D-RANS** ist keine Browserarbeit und liefert bei schlechtem Aufbau
selbstbewusst falsche Zahlen.

Autodesk Forma bestätigt das von der anderen Seite: Dort läuft im Browser
**kein CFD, sondern ein trainiertes Surrogat**; das eigentliche CFD rechnet
30–90 Minuten in der Cloud, und Forma kennzeichnet sichtbar, welches von beidem
man ansieht. Dieser vierte Weg setzt einen Bestand gerechneter CFD-Fälle
voraus, den Umbra nicht hat und nicht herstellen kann.

**Was deshalb fehlt und im Blatt steht:** keine Geschwindigkeit an einem Punkt,
keine Rückströmgebiete, keine Komfortkriterien nach Lawson oder NEN 8100. Und
zwei bekannte Wirkungen: die **Düsenwirkung** in engen Durchgängen, die
beschleunigt, obwohl der Anlauf kurz ist — und der **Fallwind**, der von oben
kommt und in keiner waagerechten Messung auftaucht.

## Die Draufsicht

Ein Schalter über dem Zeichenfeld stellt die Ansicht senkrecht auf den
**Rahmen des Datenvertrags** — orthogonal, Norden oben, kein Blickwinkel.
Der Ausschnitt ist der Rahmen und nicht die Bebauung: Zwei Pläne desselben
Gebiets sind damit übereinanderlegbar, und was Nolli als Ergebnis meint, ist
der Rahmen. Passt er nicht ins Seitenverhältnis des Feldes, wird die kürzere
Seite maßgeblich und seitlich mehr gezeigt — abgeschnitten wird nichts.

**Der Plan steht mit Rand im Feld**, nicht bündig an der Kante, und eine
Haarlinie zeichnet das Plangebiet. Was außerhalb liegt, deckt ein
**Passepartout** zu — vier Flächen in der Farbe des Zeichenfelds. Zugedeckt
statt geschnitten: Schnittebenen würden die Häuser aufschneiden und ihr hohles
Inneres zeigen. Nötig ist es, weil Nolli Baukörper ganz exportiert, sobald ihre
Hüllbox den Rahmen berührt; der Überstand gehört nicht in den Plan.

**Maßstabsleiste, Nordpfeil und Bedienhinweis entfallen im Plan.** Der Maßstab
steht in der Statuszeile, Norden ist oben, und ein Bedienhinweis stünde auf
einer Fläche, die man ausgibt.

**Die Ausgabe speichert genau den Rahmen**, nicht das Feld und nicht den
Überstand. Der Ausschnitt wird nicht geschätzt, sondern gerechnet: Die beiden
Rahmenecken werden durch dieselbe Kamera projiziert, mit der gerendert wurde —
dieselbe Überlegung wie bei der Pufferregel. Passt die Fußleiste dann nicht
mehr nebeneinander, weicht der Sonnenstand links; er steht ohnehin im Blatt,
die Herkunft steht nur dort.

### Warum die Linienzeichnung nicht mehr verblasst

Nollis Linie besteht aus haardünnen Strichen — *gemessen*: 0,02 % der
Bildpunkte dunkler als 140, der dunkelste 130. Beim Verkleinern mittelt die
Grafikkarte jeden Strich mit dem Weiß daneben; auf Bildschirmmaß blieb davon
**193**, eine Stufe tiefer 213. Die Zeichnung verblasste, je weiter man
herauszoomte.

Umbra baut die Mipstufen deshalb selbst und streckt jede so, dass ihr
dunkelster Wert wieder der der Vorlage ist. Beim Schwarzplan ändert das nichts
— dort überlebt das Dunkle die Mittelung ohnehin.

*Der naheliegende Griff wäre falsch gewesen:* „dunkelstes statt gemitteltes
Verkleinern" rettet die Linie und macht beim Schwarzplan die Häuser mit jeder
Stufe fetter. **Die Verkleinerung darf nichts hinzufügen, aber sie soll auch
nichts wegnehmen.**

Gerechnet wird das **nachgereicht**: Es kostet je Textur einige hundert
Millisekunden, und der Start soll gefüllt sein, nicht warten. Was zuerst blass
steht, wird kurz darauf deutlich.

### Der Schlagschatten auf den rechnenden Blättern

**Der gezeichnete Schlagschatten hängt am Blatt, nicht an einem Schalter.**
Auf den Sonnenblättern 1 und 2 steht er — dort *ist* er der Gegenstand. Auf
den drei rechnenden Blättern ist er aus: Dort liegt eine Auswertung über dem
Modell, und der graue Schatten legt sich darüber und macht aus einer Messfarbe
eine dritte. Bei einer Kachel fürs Paket wäre er sogar eingebrannt — genau der
Fall, den `_grund` bei Nolli löst.

Kurz gab es dafür einen Schalter; er ist wieder heraus. Es gibt keine Lage, in
der man den Schatten anders will, als das Blatt ihn verlangt — und ein
Schalter, der immer gleich steht, ist keiner.

**Nicht abgeschaltet wird die Verschattung in der Rechnung.** Die steckt im
Strahltest; ein Blatt ohne gezeichneten Schatten zeigt dieselben Zahlen.

*Gemessen* an der mitteldunklen Fläche im Bild: 17,6 % auf Blatt 1, 18,0 % auf
Blatt 2, 8,9 % auf den Blättern 3 bis 5.

### Die Kachel fürs Paket

Der Knopf **„Kachel fürs Paket"** im Teil *Ausgabe* macht etwas anderes als
„Bild sichern": Er rendert das Blatt **neu** auf `pixel_breite × pixel_hoehe`
des Datenvertrags — bei der HafenCity 4096 × 3072 —, mit der Kamera genau auf
dem Rahmen, ohne Rand, ohne Fußleiste, ohne Legende.

Damit ist das Ergebnis **deckungsgleich mit Nollis Darstellungen** und lässt
sich als weitere ins Paket legen, neben Schwarzplan und Nutzung. Ein
Bildschirmausschnitt könnte das nicht: Das Fenster hat die Auflösung des
Bildschirms, nicht die des Pakets.

*Geprüft*, nicht behauptet: Kachel und `schwarzplan_grund.webp`
kreuzkorreliert über 49 Verschiebungen — die beste Deckung liegt bei Versatz
**(0, 0)**, Wert 728 gegen 277 beim schlechtesten. Eine Kachel ist kein Blatt:
Sie trägt keine Beschriftung, sie trägt Deckungsgleichheit.

Der Dateiname sagt Inhalt und Herkunft — `besonnung_umbra.png`,
`strahlungslast_umbra.png`. Das `_umbra` bleibt dran: In einem Paket, das sonst
Nolli füllt, muss unterscheidbar sein, wer eine Darstellung gemacht hat.
Ausgegeben wird PNG; das Paket will verlustfreies WebP, die Umwandlung
geschieht beim Schnüren.

**Der Unterschied, der beim Messen zählt:** In der Draufsicht gilt der Maßstab
für das **ganze Bild**, in der Raumansicht nur an der Drehachse, weil die
Perspektive alles Nähere größer zeichnet. Deshalb steht „Draufsicht" in der
Fußleiste jeder Ausgabe und `_plan` im Dateinamen — wer Abstände aus einem
Blatt abgreift, muss wissen, welches von beidem er vor sich hat.

Im Plan ist das Drehen abgeschaltet und die linke Maustaste schiebt; der
Bedienhinweis unten rechts sagt es. Eine Draufsicht, die man kippen kann, ist
keine.

## Was die Zahlen sind und was nicht

- **Nur direkte Strahlung** auf den Blättern 1 bis 3. Kein Diffusanteil, keine
  Bodenreflexion, keine Bewölkung; die Werte sind dort die obere Grenze.
  Blatt 4 rechnet den Diffusanteil mit, weil Open-Meteo ihn liefert — dafür
  nur am Boden und nur für einen Tag.
- **Der Besonnungsnachweis** misst auf der Fläche. DIN 5034-1 misst in
  Fenstermitte innen und verlangt den Nachweis für mindestens einen
  Aufenthaltsraum – ein Fassadenpunkt ist die günstigere Annahme.
- Die Rechnungen laufen im Hauptthread. Der Rechenstand steht immer im
  Schriftfeld, der Knopf zählt Prozente und bricht auf zweiten Druck ab.

### Wie lange die Voreinstellungen brauchen

Eingemessen auf dem mitgelieferten HafenCity-Modell (8.512 Dreiecke):

| Blatt | Voreinstellung | Dauer |
|---|---|---|
| 1 · Besonnungsnachweis | 5-Minuten-Schritte, drei Tage | ≈ 0,5 s |
| 3 · Einstrahlung | 9 m Kantenlänge, 8–18 Uhr stündlich | ≈ 20 s |

Die Regler reichen deutlich feiner hinunter – bei 5 m und halbstündlichem
Schritt sind es auf Blatt 3 rund 530.000 Teildreiecke und anderthalb Minuten.

## Rechenstand

Jedes Blatt trägt einen von vier Zuständen, sichtbar im Register, im Blattkopf
und im Schriftfeld:

`nicht gerechnet` · `rechnet` · `gültig` · `veraltet`

`veraltet` erscheint, sobald sich seit dem Lauf der Zeitpunkt, das Modell oder
eine Einstellung geändert hat. Die gezeigten Werte gehören dann noch zum alten
Stand und sagen das.

## Eigene Modelle

Im Teil „Modell" in der Schiene je Ebene auf „Ersetzen". GLB oder GLTF aus
Rhino, Blender, Cadmapper oder der Nolli-Kette. Das Hauptgebäude setzt den
Mittelpunkt der Szene; alle anderen Ebenen übernehmen denselben Versatz, die
relativen Lagen bleiben also erhalten. Die Dateien werden im Browser gelesen
und nirgendwohin geschickt.

## Dienste

Beide ohne Schlüssel, beide freiwillig – Umbra rechnet auch ohne sie:

- **Nominatim** (OpenStreetMap) für die Ortssuche
- **Open-Meteo** für Blatt 5

## Was online liegt

```bash
./pruefe-stand.sh          # ist der ausgelieferte Stand dieser?
```

Ruft die Live-Adresse ab und vergleicht die Prüfsumme mit `umbra.html`. Drei
getrennte Fehlerausgänge: nicht erreichbar (2), Statusfehler (3), **Status 200,
aber nicht das Werkzeug** (4). Der dritte ist der gefährliche — eine
Fehlerseite mit Status 200 liefert eine Prüfsumme, und die sieht aus wie ein
Stand. Erkannt wird an `<title>Umbra</title>`; eine Zeichenkette aus dem
Quelltext wechselt mit der Fassung und kann Fassungen deshalb nicht
unterscheiden.

Keine Live-Prüfung — ob das Ausgelieferte *taugt*, fragt
`pruefe-live-umbra.mjs` beim Werkzeugkasten der Website-Session.
