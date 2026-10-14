# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Stack

Single-File HTML, wie der Vorgänger `nai-env.html`: eine `.html` plus ein `modelle/`-Ordner mit GLB-Dateien, per FTP ablegbar, kein Buildschritt. Tailwind über CDN, three.js über Importmap (jsdelivr), Google Fonts. Nutzerentscheidung, bewusst gegen ein Vite-Projekt.

## Users

Primär: Besucher von zinssmeister.info — Auftraggeber, Agenturen, Hochschulkontakte —, die in wenigen Minuten einsehen wollen, was „Computational Design" bei NAI konkret heißt. Sie kommen ohne Vorwissen, ohne eigenes Modell und ohne Geduld für eine Einarbeitung. Sie klicken, drehen, schieben den Zeitregler und wollen sofort etwas Glaubwürdiges sehen.

Sekundär: Volker selbst und Studierende des HCU-Kurses NAI / Parametrische Geometrie, die eigene GLB-Modelle hochladen und damit real rechnen.

## Product Purpose

Umbra ist ein Besonnungswerkzeug für den städtebaulichen Entwurf, im Browser. Es lädt ein Stadtmodell aus Nolli, stellt den Sonnenstand für Ort und Zeitpunkt korrekt dar und rechnet daraus Verschattung, Besonnungsdauer nach DIN 5034-1 und Einstrahlung — ohne Installation, ohne Account, ohne Rechenzentrum.

Erfolg heißt: ein fachfremder Besucher versteht in unter einer Minute, was er sieht, und ein Fachbesucher erkennt, dass die Zahlen nicht dekorativ sind.

## Positioning

Nolli zeichnet den Schatten mit einem Faktor. Umbra rechnet ihn.

Echte Strahlungsberechnung per BVH-Raycasting gegen 144 Sonnenpositionen, im Browser, auf einem echten Stadtmodell — nicht ein gerendertes Bild von einer Analyse. Die drei NAI-Manifestprinzipien sind hier wörtlich eingelöst: *Geometry first* / *Tools, not magic* / *Image and CAD must converge*.

Abgrenzung: Ladybug/Honeybee brauchen Rhino und Grasshopper. Umbra braucht einen Browser-Tab.

## Operating Context

**Umbra ist die dritte Station einer Pipeline, kein Einzelstück.**

1. **Urban AI Skills** ([github.com/yougop/nolli](https://github.com/yougop/nolli)) — die Methode: Geometrie deterministisch, Semantik per LLM. Zehn Schritte von Rahmen bis Rhino.
2. **Nolli** (`zinssmeister.info/app/nolli/`) — das Zeichenwerk: zieht einen maßstäblichen Rahmen über OSM-Bestand, trennt Ebenen über Grauwert und Strichbreite, gibt DXF, Blatt und ein Kontextmodell aus. Zeichnet den Gebäudeschatten bereits — aber als **feste Kunstsonne**: Nordwest, 48,8° über dem Horizont, daraus je Meter Bauhöhe 0,647 nach Osten und 0,588 nach Süden. Ein Wert für das ganze Blatt, für jeden Tag des Jahres derselbe. (Stand 13.09.2026 von Nolli bestätigt; davor lag eine gröbere Schätzung von 0,45 zugrunde.)
3. **Umbra** — rechnet denselben Schatten mit der echten Sonne, in drei Dimensionen, und macht daraus Besonnungsdauer und Einstrahlung.

Das Modell kommt aus dieser Kette. Nolli liefert ein **Paket aus drei Dateien mit gemeinsamem Stamm**, und Umbra liest alle drei:

| Datei | Was Umbra daraus nimmt |
|---|---|
| `*.obj` | die Baukörper — Z nach oben, Y nach Norden, Meter, Ursprung auf der Südwestecke des Rahmens |
| `*_modellaufsicht_grund_4096px.png` | der Boden als Textur: Wasser, Grün, Straßen, Plätze, Kais – **ohne Gebäude und ohne deren gemalte Schatten**. Nolli zeichnet den Grund, Umbra stellt die Baukörper darauf |
| `*_frame.json` | den Datenvertrag: Gitter, Ausschnitt, Maßstab, Ortsname, Quelle, Lizenz, Anteil gemessener Höhen |

Aus dem Vertrag rechnet Umbra die transversale Mercator-Abbildung zurück und **kennt damit seinen Standort ohne Adresssuche**. Umbra erfindet keine Geometrie, es misst die gelieferte.

**Schwächen der Grundlage stehen im Vertrag, nicht im Quelltext.** Führt ein Paket das Feld `vorbehalte` – auch leer –, ist es maßgeblich; fehlt es, werden die vor seiner Einführung bekannten Mängel angenommen. Umbra zeigt jeden Vorbehalt dort, wo er wirkt, und unterschiedlich gewichtet: `daecher_flach` steht beim Besonnungsnachweis entwarnend — ein geneigtes Dach wirft ungefähr den Schatten seines Mittels zwischen Traufe und First.

Die Höhenherkunft liefert der Vertrag je Baukörper (`koerper[].quelle`): gemessen aus OSM, aus der Geschosszahl gerechnet, oder mit acht Metern angenommen. Umbra zählt sie einzeln aus, statt eine Quote zu runden – bei 5 von 1905 Körpern ist „fünf" die Aussage und „0,3 %" die Nachkommastelle, hinter der sie verschwindet. Nolli hat ein dokumentiertes Designsystem (`https://github.com/yougop/nolli/blob/main/DESIGN.md`, „Die Stifttabelle"): helle Grauleiter, ein einziger Akzent, Haarlinien statt Rahmen, Satoshi für Sprache und JetBrains Mono für jeden Messwert. Umbra ist dessen Geschwister und erbt das System, statt ein eigenes zu erfinden.

- Aufruf als Unterseite eines Architektur-Portfolios, meist am Notebook (1280–1680 px breit, 720–900 px hoch), gelegentlich am großen Monitor. Notebook-Tauglichkeit ist harte Anforderung, nicht Zugabe.
- Beim ersten Aufruf ist die Szene bereits gefüllt: HafenCity Universität Hamburg mit Nachbarbebauung und Topografie. Kein leerer Zustand, kein Upload-Zwang.
- Der Regelfall ist ein Paket aus Nolli: OBJ-Modell, Aufsichts-Textur als PNG, Datenvertrag als JSON. Drei Slots, einer je Datei. Ein eigener Entwurf kommt als GLB/GLTF aus Rhino oder Blender darüber; dann lässt sich der Datenvertrag abschalten, weil er sonst Ort und Rahmen eines fremden Ausschnitts erzwingen würde.
- Der Standort steht im Datenvertrag und ist dann nicht wählbar — das Modell ist auf dessen Gitter eingemessen. Ohne Vertrag über Nominatim suchbar, ohne Schlüssel.

## Capabilities and Constraints

Fünf Blätter, alle voll gerechnet — keine Platzhalter, keine „Phase 2"-Slots:

1. **Sonnenstand** — Tagesbahn, Azimut und Höhe, Schattenwurf zum eingestellten Zeitpunkt, Besonnungsnachweis gegen DIN 5034-1
2. **Sonnenbahn** — die drei Stichtagsbahnen und die stündlichen Analemmen: der Himmelsausschnitt, aus dem dieser Ort überhaupt Sonne bekommt
3. **Gebäudehülle** — direkte Einstrahlung auf Fassaden und Dächer: BVH-Raycasting auf adaptiv geteilten Dreiecken, mit Selbst- und Nachbarverschattung
4. **Stadtraum** (16.09.2026) — was der Boden zwischen den Häusern an einem Hitzetag abbekommt: direkte Sonne je Stunde plus Diffusstrahlung nach Himmelsanteil, mit dämpfenden Baumkronen. Stundenwerte von Open-Meteo, Tag voreingestellt auf den heißesten des letzten Sommers. **Rechnet Strahlung, keine Temperatur** — deshalb „Strahlungslast" und nicht „Klima". Die Blätter 3 und 4 heißen seit dem 17.09.2026 nach ihrem **Empfänger** — Gebäudehülle gegen Stadtraum —, weil „Einstrahlung" und „Strahlungslast" sich zu nahe waren; die Größe steht im Untertitel.
5. **Windexposition** (16.09.2026) — freier Anlauf in sechzehn Richtungen, gewichtet mit der gemessenen Windrose eines Jahres. **Ausdrücklich kein CFD:** kein Strömungsfeld, keine Geschwindigkeit, keine Komfortkriterien. Die Streichung von Wind/CFD zu Beginn bleibt damit bestehen — gebaut ist der Teil, der Geometrie ist.

Ausdrücklich gestrichen (Nutzerentscheidungen): Wind/CFD, Luftqualität und Lärmemission — diese existierten nur als Stub-Panels; später auch **Wetter**, weil Live-Wetterdaten zur Frage nach Schatten und Ertrag nichts beitragen. Mit ihnen verschwindet das Stub-Konzept vollständig. **Open-Meteo ist am 16.09.2026 zurückgekehrt — aber als Eingang in die Rechnung, nicht als Meldung daneben:** Blatt 4 braucht die Aufteilung in direkte und diffuse Strahlung, und ohne sie wäre der Diffusanteil geschätzt.

**PV ist ausdrücklich gestrichen** (Nutzerentscheidung, 16.09.2026): Google rechnet Dachpotenziale längst, die Frage ist eher kommerziell als städtebaulich, und mit ihr entfällt die einzige Zahl in Umbra, die nicht gerechnet, sondern über den Breitengrad geschätzt war. Was bleibt, ist durchgehend gerechnet.

**„Fläche prüfen" ist gestrichen** (Nutzerentscheidung, 16.09.2026): „hat nie richtig Sinn gemacht" — die Auswahl einer Fläche beantwortete keine Frage, die der Besonnungsnachweis am geklickten Punkt nicht besser beantwortet.

**Das Paket ist die Ladeeinheit.** Ein Nolli-Paket wird als ZIP oder als ausgepackter Ordner im Ganzen geladen; der Datenvertrag kommt darin mit und hat deshalb keinen eigenen Ladeknopf mehr. Modell und Aufsichts-Textur behalten ihren, für den Fall, dass jemand ein eigenes Modell mitbringt.

**Darstellungen.** Ein Paket bringt mehrere Texturen im selben Rahmen mit; das Startpaket führt drei — Schwarzplan, Linie, Aufsicht. Sie stehen als segmentierter Umschalter **über dem Zeichenfeld**, in Nollis Bauform. Voreingestellt ist **Schwarzplan**, auf jedem Blatt (Nutzerentscheidung, 16.09.2026). Auf den Blättern 4 und 5 ist die Aufsicht gesperrt: Ein farbiger Grund unter einer Messrampe ergibt eine dritte Farbe, die keine von beiden erklärt. „Nutzung“, „Invertiert“ und „Datentiefe“ sind auf Nutzerentscheidung aus dem Startpaket genommen; ein volles Nolli-Paket bringt sie weiterhin mit.

**Bäume** (Stufe 1, 16.09.2026): 1.781 Kronen aus dem Paket, zuschaltbar neben der Darstellungsleiste, als grüne undurchsichtige Ikosaeder — Nutzerentscheidung. Reine Darstellung: Sie gehen in keine Rechnung ein, werfen im Bild aber Schatten; das steht als Warnung daneben. Kronenmaß gemessen bei 775, sonst pauschal 6,0 m (derselbe Wert, den Nolli zeichnet); Höhe immer angenommen.

Technische Grenzen: WebGL2 vorausgesetzt; Die Strahlungsrechnung läuft auf dem Hauptthread und dauern auf schwacher Hardware spürbar; GLB-Dateien werden clientseitig gelesen, nichts wird hochgeladen.

**Umbra liefert ins Paket zurück** (17.09.2026): Die Ausgabe „Kachel fürs Paket" rendert ein Blatt auf Auflösung und Rahmen des Datenvertrags, deckungsgleich mit Nollis Darstellungen. Aus einem Werkzeug, das das Paket nur liest, wird damit eines, das es erweitert — die Kette bekommt einen Rückweg.

## Brand Commitments

- Neuer Produktname: **Umbra**. Der Vorgängername „NAI ENV" entfällt.
- Absender bleibt NAI — Numeric Architectural Intelligence (Volker Zinßmeister, Hamburg), kreative Kurzform NAIWTF.
- Oberflächensprache: Deutsch.
- Umbra tritt als Geschwister von Nolli auf, erkennbar aus derselben Werkstatt: dieselbe Grauleiter, dieselben Schriften, dieselbe Haarlinien-Disziplin, ein eigener Akzent.
- Volkers Arbeitsstil: direkte, präzise Sprache ohne Marketingfüllung und ohne übermäßige Hinweise.

## Evidence on Hand

- `modelle/` — das Startpaket der HafenCity in Nollis eigener Ordnung (`frame.json`, `modell.obj`, `bilder/*.webp`), Standardszene beim Start: 338 Baukörper auf 192 ha, Texturen 4096 × 3072 px, Datenvertrag mit Georeferenz, Höhenherkunft je Baukörper und Vorbehalten. Vier Darstellungen; beim Start werden nur drei Dateien geholt.
- `modelle/hcu-demo/*.glb` — die drei HCU-Dateien des Vorgängers, ausgemustert, nur noch als Prüfmaterial für den Weg „eigenes Modell ohne Datenvertrag".
- `nai-env.html` (auf der Website) — der Vorgänger, als Funktions- und Datenreferenz gültig, als Optik ausdrücklich nicht.
- Keine Nutzerzahlen, keine Referenzkunden für dieses Tool, keine Benchmarks. Nichts davon darf erfunden werden.

## Product Principles

1. **Die Szene ist das Produkt.** Die Oberfläche bedient das 3D-Bild und stellt sich nicht davor.
2. **Gefüllt starten.** Wer die Seite öffnet, sieht sofort ein echtes Gebäude unter echter Sonne — nie einen Platzhalterwürfel oder eine Upload-Aufforderung.
3. **Nur was rechnet, steht im Menü.** Keine reservierten Slots, keine Ankündigungen.
4. **Zahlen sind belastbar oder gar nicht da.** Rechenstand, Auflösung und Annahmen bleiben sichtbar, damit ein Fachbesucher die Werte prüfen kann.
5. **Ein Werkzeug der Kette, kein Solitär.** Was Nolli entschieden hat, wird nicht neu entschieden — Grauleiter, Schriften, Haarlinie, 4-px-Radius gelten hier weiter.
6. **Das Notebook ist der Normalfall.** Jede Layoutentscheidung wird bei 1280×720 geprüft, nicht bei 2560×1440.

## Accessibility & Inclusion

Keine formale Norm vereinbart. Faktische Anforderung aus dem Kontext: Bedienbarkeit bei 1280×720 ohne Scrollfallen oder überlappende Panels, lesbare Schriftgrößen im dunklen Interface (der Vorgänger arbeitet durchgehend mit 9–11 px Fließtext, das ist zu klein), und ausreichender Kontrast gegen die 3D-Szene im Hintergrund.
