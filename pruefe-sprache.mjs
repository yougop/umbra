/**
 * Die Oberfläche auf Englisch durchgehen und deutsche Reste melden.
 *
 * Startet einen eigenen kleinen Server auf diesem Ordner, öffnet Umbra mit
 * `umbra.sprache = en`, schaltet jedes Blatt, beide Ansichten, Bäume und
 * Marker an, klappt alle Falten auf und sammelt allen sichtbaren Text samt
 * `title`, `aria-label` und `placeholder`. Gemeldet wird, was Umlaute oder
 * typisch deutsche Wörter enthält. Ortsnamen aus dem Paket (HafenCity) und
 * Dateinamen gehören dem Datenvertrag und fallen nicht darunter.
 *
 * Danach einmal auf Deutsch und zurück: Der Wechsel darf keinen Fehler werfen,
 * und auf Deutsch darf kein englischer Knopftext stehen bleiben.
 *
 * Vorbild: nolli/werkzeug/pruefung/sprache.mjs.
 *
 *     npm install                       # einmal, holt puppeteer-core
 *     node pruefe-sprache.mjs [zielordner-fuer-bildschirmfotos]
 *
 * Chrome: $CHROME, sonst der neueste unter ~/.cache/puppeteer/chrome/.
 * Ausgang 0 = keine Reste, 1 = Reste oder Fehler.
 */
import puppeteer from 'puppeteer-core';
import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import http from 'node:http';
import { fileURLToPath } from 'node:url';

const hier = path.dirname(fileURLToPath(import.meta.url));
const ziel = process.argv[2] || fs.mkdtempSync(path.join(os.tmpdir(), 'umbra-sprache-'));
fs.mkdirSync(ziel, { recursive: true });

function chromeFinden() {
  if (process.env.CHROME) return process.env.CHROME;
  const wurzel = path.join(os.homedir(), '.cache/puppeteer/chrome');
  const staende = fs.existsSync(wurzel) ? fs.readdirSync(wurzel).sort() : [];
  for (const s of staende.reverse()) {
    const p = path.join(wurzel, s, 'chrome-linux64/chrome');
    if (fs.existsSync(p)) return p;
  }
  throw new Error('Kein Chrome gefunden. CHROME=/pfad/zu/chrome setzen.');
}

// Ein Server ohne Zwischenspeicher: Sonst misst man den eigenen Cache mit.
const ARTEN = { '.html': 'text/html', '.json': 'application/json', '.obj': 'text/plain',
  '.webp': 'image/webp', '.png': 'image/png', '.woff2': 'font/woff2', '.js': 'text/javascript', '.glb': 'model/gltf-binary' };
const server = http.createServer((anf, ant) => {
  const p = path.join(hier, decodeURIComponent(new URL(anf.url, 'http://x').pathname));
  if (!p.startsWith(hier) || !fs.existsSync(p) || fs.statSync(p).isDirectory()) { ant.writeHead(404); ant.end(); return; }
  ant.writeHead(200, { 'Content-Type': ARTEN[path.extname(p)] || 'application/octet-stream', 'Cache-Control': 'no-store' });
  fs.createReadStream(p).pipe(ant);
});
await new Promise(r => server.listen(0, '127.0.0.1', r));
const adresse = `http://127.0.0.1:${server.address().port}/umbra.html`;

const browser = await puppeteer.launch({
  executablePath: chromeFinden(), headless: 'shell', protocolTimeout: 600000,
  args: ['--no-sandbox', '--enable-unsafe-swiftshader', '--use-gl=angle', '--use-angle=swiftshader',
         '--hide-scrollbars', '--force-device-scale-factor=1'],
});
const s = await browser.newPage();
await s.setViewport({ width: 1440, height: 900 });
await s.setCacheEnabled(false);
const fehler = [];
s.on('pageerror', e => fehler.push('pageerror: ' + e.message));
s.on('console', m => { if (m.type() === 'error') fehler.push('console: ' + m.text()); });

await s.evaluateOnNewDocument(() => { try { localStorage.clear(); localStorage.setItem('umbra.sprache', 'en'); } catch {} });
await s.goto(adresse, { waitUntil: 'networkidle2' });
await s.waitForFunction(() => !document.getElementById('ladeblatt'), { timeout: 120000 });
const warte = (ms) => new Promise(r => setTimeout(r, ms));

const texte = new Set();
const sammeln = async () => {
  const roh = await s.evaluate(() => {
    document.querySelectorAll('details').forEach(d => { d.open = true; });
    const aus = [document.body.innerText, document.documentElement.lang,
                 document.querySelector('meta[name="description"]')?.content || ''];
    for (const e of document.querySelectorAll('[title],[aria-label],[placeholder]'))
      aus.push(e.getAttribute('title') ?? '', e.getAttribute('aria-label') ?? '', e.getAttribute('placeholder') ?? '');
    return aus;
  });
  for (const x of roh) for (const z of x.split('\n')) if (z.trim()) texte.add(z.trim());
};
const klick = (sel) => s.evaluate((sel) => { const e = document.querySelector(sel); if (e && !e.hidden) { e.click(); return true; } return false; }, sel);

await sammeln();
await s.screenshot({ path: path.join(ziel, '1-start-en.png') });

// Jedes Blatt, in 3D und im Plan
for (let n = 1; n <= 5; n++) {
  await s.keyboard.press(String(n)); await warte(1500);
  await sammeln();
  await klick('[data-ansicht="plan"]'); await warte(600); await sammeln();
  await klick('[data-ansicht="raum"]'); await warte(400);
  await s.screenshot({ path: path.join(ziel, `2-blatt-${n}.png`) });
}

// Blatt 1: Bäume an, Marker an, in die Feldmitte klicken – das füllt den
// Besonnungsnachweis, den es ohne Klick nicht gibt.
await s.keyboard.press('1'); await warte(1200);
await klick('#baum-schalter'); await warte(800);
await klick('#merk-schalter'); await warte(300);
const feld = await s.$('#zeichenfeld');
const k = await feld.boundingBox();
for (const [fx, fy] of [[0.5, 0.55], [0.45, 0.6], [0.55, 0.5]]) {
  await s.mouse.click(k.x + k.width * fx, k.y + k.height * fy); await warte(2500);
}
await sammeln();
await s.screenshot({ path: path.join(ziel, '3-nachweis-en.png') });
await klick('#reihe-zeigen'); await warte(4000); await sammeln();
await s.keyboard.press('Escape');

// Blatt 2 und 3: die Umschalter im Blatt
await s.keyboard.press('3'); await warte(1200);
await klick('[data-modus="zeitraum"]'); await warte(500); await sammeln();
await s.keyboard.press('4'); await warte(3000);
await klick('[data-zeigt="himmel"]'); await warte(500); await sammeln();
await klick('[data-mischung="deckend"]'); await warte(500); await sammeln();
await s.keyboard.press('5'); await warte(3000); await sammeln();

// Hin und zurück
await klick('#sprach-wahl [data-sprache="de"]'); await warte(1500);
const deutsch = await s.evaluate(() => document.body.innerText);
await s.screenshot({ path: path.join(ziel, '4-deutsch.png') });
await klick('#sprach-wahl [data-sprache="en"]'); await warte(1500);
await sammeln();
await s.screenshot({ path: path.join(ziel, '5-zurueck-en.png') });

await browser.close();
server.close();

// Ortsnamen und Dateinamen aus dem Paket sind keine Reste.
const erlaubt = /HafenCity|Hamburg|frame\.json|\.obj|\.webp|DIN 5034|Ladybug|Open-Meteo|Lawson|NEN 8100/g;
const verdacht = /[äöüßÄÖÜ]|\b(und|der|die|das|nicht|mit|frei|keine?|Blatt|Blätter|Sonne|Rechnung|rechnen|Gebäude|Bäume|Darstellung|Ausgabe|zurück|laden|Laden|Stand|Uhr|Tag|Jahr|Höhe|Paket|Datenvertrag|Ergebnis|Ausschnitt|Einstellung)\b/;
const reste = [...texte].filter(x => verdacht.test(x.replace(erlaubt, '')));
const englischImDeutschen = ['Sheet', 'Load Nolli package', 'Compute', 'Search', 'Export', 'Caveats']
  .filter(w => deutsch.includes(w));

fs.writeFileSync(path.join(ziel, 'texte.txt'), [...texte].join('\n'));
console.log(`Bildschirmfotos und gesammelte Texte: ${ziel}`);
console.log(`${texte.size} Textzeilen gesammelt.`);
if (fehler.length) console.log('Fehler:\n  ' + fehler.join('\n  '));
console.log(reste.length ? 'Deutsche Reste:\n  ' + reste.join('\n  ') : 'Keine deutschen Reste.');
console.log(englischImDeutschen.length ? 'Englisch nach dem Wechsel auf Deutsch: ' + englischImDeutschen.join(', ') : 'Wechsel auf Deutsch sauber.');
process.exit(fehler.length || reste.length || englischImDeutschen.length ? 1 : 0);
