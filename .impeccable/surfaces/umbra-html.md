---
version: 1
slug: "umbra-html"
primary_target: "umbra.html"
related_targets: []
---

## Scope

Umbra — Solar- und Umweltanalyse im Browser, Single-File `umbra.html`. Dritte Station der Pipeline Urban AI Skills → Nolli → Umbra. Besuchermodus: **Experience** (die Szene führt), ausgeführt mit der Disziplin von Operate (Aufgabe, Zustand, Messwert).

## Publikum und Aufgabe

Portfoliobesucher am Notebook, ohne Vorwissen und ohne eigenes Modell: drehen, Zeit ziehen, Blatt wechseln, eine belastbare Zahl sehen. Sekundär Volker und HCU-Studierende mit eigenem GLB.

## Belege

`modelle/` (Startpaket aus Nolli in dessen eigener Ordnung: `frame.json`, `modell.obj`, `bilder/*.webp` — echte HafenCity-Geometrie, Standardszene, drei Darstellungen — Schwarzplan, Linie, Aufsicht, alle als Grund-Fassung ohne Bauten und ohne Bäume), Nominatim, DIN 5034-1. Keine Nutzerzahlen, keine Referenzkunden — nichts davon erfinden.

## Direction contract

**THESIS** Umbra ist ein Nachweisblatt, kein Viewer: Nolli zeichnet den Schatten mit einem Faktor, Umbra rechnet ihn und legt ihn aufs Blatt. Verweigert wird die dunkle Bühne mit schwebenden Glaspanels und Neonakzent.

**OWN-WORLD** Nollis Grauleiter `#FAFAFA`–`#111111`, Haarlinie 1px als einziges Trennmittel, Flächen statt Karten, Radius 4px. Satoshi spricht, JetBrains Mono misst mit `tabular-nums`. Ein Akzent, Schattenblau `#3D6FA8`: Sonne, aktives Blatt, Auswahl, Ring der Hauptaktion. Die Messskala ist eine eigene, deklarierte Rampe und nie der Akzent.

**STORY** Der Besucher sieht sofort ein weißes Stadtmodell unter echter Sonne, zieht die Maßkette, sieht Schatten wandern, springt auf Blatt 3 und bekommt eine Zahl mit Rechenstand und Norm daneben.

**FIRST VIEWPORT** Vollflächiges Zeichenfeld, HafenCity unter echter Sonne (Darstellung „Schwarzplan“), darüber die Darstellungsleiste; Haarlinienrahmen mit Mittenmarken; links Blattregister 1–3; unten die Zeitachse als Maßkette; darunter das Schriftfeld als durchlaufende Spur mit Datum, Maßstab, Blatt und Rechenstand. Hauptaktion „Rechnen" als gesetzter Fuß der rechten Schiene.

*Nachträge aus der Bearbeitung (Nutzerentscheidungen, nicht Abweichungen):* Das Register führt vier Blätter: „Wetter" wurde gestrichen, später auch „PV-Potenzial" — es rechnete zwar, gehörte aber nicht in ein städtebauliches Entwurfswerkzeug, und mit ihm entfiel die einzige geschätzte Zahl. Der Stempel unten rechts ist entfallen; seine Felder laufen als Spur über die volle Breite, der Ort steht stattdessen im Kopf, wo er zusammen mit seiner Herkunft („laut Datenvertrag") gelesen wird. Ein Revisionsindex wird nicht geführt: Umbra rechnet jedes Blatt live und führt stattdessen vier Rechenzustände. Der Grund des Zeichenfelds trägt die Farbe der Oberfläche (`--grund`): hell im hellen Schema, dunkel im dunklen. Eine frühere Fassung ließ ihn dem Sonnenstand folgen und bei flacher Sonne warm werden; das ist auf Nutzerentscheidung entfallen („Nicht mehr gelblich"). Umbra gibt Blätter aus — Bild als PNG, Tages- und Jahresverlauf als WebM —, jedes mit einer Fußleiste aus Ort, Zeitpunkt, Sonnenstand, Maßstab und Blatt. „Fläche prüfen“ ist entfallen („hat nie richtig Sinn gemacht“). Geladen wird das **Paket** als Ganzes (ZIP oder Ordner); der Datenvertrag kommt darin mit und hat keinen eigenen Ladeknopf mehr, Modell und Aufsichts-Textur behalten ihren. Die Texturen des Pakets stehen als segmentierter Umschalter **über** dem Zeichenfeld, in Nollis Bauform; voreingestellt ist „Schwarzplan“, auf jedem Blatt. „Nutzung“ und „Invertiert“ sind aus dem Startpaket genommen; die Bodenfassung heißt schlicht „Aufsicht“, und neben der Leiste steht nur noch die Warnung vor dem eingebrannten Schatten. Dass beim Start ein mitgeliefertes Paket bereitliegt, sagt der erste Absatz im Teil „Modell“, mit Datum und Ort.

**FORM** Deutsches technisches Datenblatt (Schriftfeld DIN EN ISO 7200, Revisionsindex, Maßkette), Kandidat 6 der geordneten Liste, Seed `65d52bde`.

**FINISH** unreviewed and undocumented is unfinished; this build ends with the finish review, the verdict, DESIGN.md, and every shipping raster carrying its provenance

## Eingezogene Disziplinen

- **Anschlusslinien** — Zahl hängt am Ort; vier sichtbare Rechenzustände: nicht gerechnet / rechnet / gültig / veraltet.
- **Der Jahresstreifen** — die Stichprobe wird gezeichnet, nicht behauptet.
- **Eindeutige Schaltzustände** — Zustand in Tinte, nichts Wichtiges nur beim Überfahren.
- **Blattnummer als Adresse** — Ziffer = Tastenkürzel = URL-Anker, Zustand verlinkbar.
- **Die Reihe** — Vergleich als Riege gleicher Felder.
- **Der Nachweis** — Werte gegen DIN 5034-1, Unterschreitung durchgestrichen.

## Offen

Genauer Zahlenwert des Akzents und die Messrampe werden beim Bau gegen die `dataviz`-Vorgaben festgelegt. Veröffentlichung auf zinssmeister.info ist bewusst noch nicht entschieden.
