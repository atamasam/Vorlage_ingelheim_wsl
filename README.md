### Vor dem Start: Vorschau aktivieren
Tippe in diese Datei und drücke Cmd+Shift+V (macOS) bzw. Ctrl+Shift+V (Windows/Linux), um die Markdown‑Vorschau zu öffnen. Es öffnet sich eine neue Ansicht – nutze sie für die formatierte, besser lesbare Darstellung.

## LaTeX-Vorlage für Projekt- und Bachelorarbeiten (DHBW/Mannheim)

Diese Vorlage hilft Studierenden, schnell eine formale Projekt- oder Bachelorarbeit in LaTeX aufzusetzen. Sie bringt Titelblatt, Sperrvermerk, Abstract, Inhaltsverzeichnis, Abkürzungsverzeichnis, Abbildungs- und Tabellenverzeichnisse, Literaturverzeichnis, Anhang und Erklärung der Eigenständigkeit bereits mit.

### Inhalt

- Anforderungen

- Schnellstart

- Projektstruktur erklärt

- Eigene Daten und Metadaten eintragen

- Inhalt schreiben (Kapitel/Abschnitte)

- Zitieren und Literatur (BibTeX/Natbib)

- Abbildungen und Tabellen einfügen

- Nützliche Hinweise (Sprache, Zeilennummern)
- Weitere Tipps und LaTeX-Befehle

---

## Anforderungen

Alles ist vorbereitet. Optional empfehlen wir VS Code mit der Erweiterung "LaTeX Workshop".

## Schnellstart (PDF bauen)

Bevorzugt (Editor): Öffne `main.tex` und klicke oben rechts auf den grünen Play-Button (Dreieck). Über den Workspace funktioniert das auch ohne lokale LaTeX-Installation. **Speichern von `main.tex` (`Strg+S` auf Windows/Linux bzw. `Cmd+S` auf macOS)** startet außerdem automatisch den Build. Beide Aktionen starten den Build und erzeugen die PDF deiner Arbeit (`main.pdf`). Änderungen an Dateien werden erst nach einem erneuten Build in der PDF sichtbar.

Alternative (Bash):

```bash
latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -outdir=_output main.tex
```

Das Ergebnis ist `main.pdf` im `_output` Ordner.

Hinweis: Beim Kompilieren erzeugt LaTeX Hilfsdateien (z. B. `.aux`, `.log`, `.out`, `.toc`, `.bbl`, `.blg`). Diese sind temporär und können ignoriert werden.

## Projektstruktur erklärt

Wichtig: `main.tex` ist das Herz der Vorlage – hier steuerst du Aufbau, Reihenfolge und Einbindung aller Inhalte.

```text
Vorlage2_deutsch_wsl/
├─ main.tex                   # Hauptdatei: lädt Vor-Text, Inhalte, Anhänge
├─ literatur.bib              # BibTeX-Datenbank für Literatur
├─ setup.sh                   # Skript zum Aufsetzen von LaTeX
├─ README.md                  # Anleitung und Hinweise zur Vorlage
├─ CHEAT_SHEET.md             # LaTeX-Befehle und Tipps für Studierende
├─ Abbildungen/               # Grafiken (Logos, Abbildungen, Signatur)
│   ├─ 00_dhbw_logo.jpg
│   ├─ 00_firma.png
│   ├─ 01_example_image.png
│   ├─ 02_firma_alternativ.jpg
│   └─ 09_signature.png
└─ Text/
    ├─ 00_vor_text/          # Front-Matter
    │   ├─ 00_config.tex     # Setzt Variablen für Arbeit und Deckblatt
    │   ├─ 00_packages.tex   # Paket- und Layout-Konfiguration (natbib, geometry, etc.)
    │   ├─ 01_deckblatt.tex  # Titelblatt
    │   ├─ 02_sperrvermerk.tex
    │   ├─ 03_zusammenfassung.tex
    │   ├─ 04_inhaltsverzeichnis.tex
    │   └─ 05_listen.tex     # Abkürzungen, Abbildungen, Tabellen
    ├─ 01_haupt_text/        # Haupttext (Kapitel/Abschnitte)
    │   └─ 00_einleitung/
    │       └─ 01_unternehmensuebersicht.tex
    └─ 02_nach_text/         # Back-Matter
        ├─ 00_anhang/        # Anhang (z. B. 00_projekt.tex)
        │   └─ 00_projekt.tex
        ├─ 01_literaturverzeichnis.tex # bindet literatur.bib ein
        └─ 02_autorenschaft.tex       # Erklärung der Eigenständigkeit
```
> ℹ️ **Beispielbild: Firma Alternative**  
>  
> Das alternative Firmenlogo verwendet ein helleres Grün als das Standardlogo.

Wesentliche Dateien:

- `main.tex`: steuert die Reihenfolge (Vor-Text → Haupttext → Literatur → Anhang → Erklärung).

- `Text/00_vor_text/00_packages.tex`: zentrale Pakete (u. a. `natbib`, `geometry`, `babel`, `listings`).

- `Text/00_vor_text/00_config.tex` erstellt alle Metadaten (Titel, Autor, Firma, Kurs, Datum, Ort etc.).

- `Text/02_nach_text/01_literaturverzeichnis.tex` stellt den Bibliographiestil ein und bindet `literatur.bib` ein.

## Eigene Daten und Metadaten eintragen

Öffne `Text/00_vor_text/00_config.tex` und passe die Makros an (Beispiel):

```tex
\ArtDerArbeit{Projektarbeit 1}
\TitelDerArbeit{Titel der Arbeit}
\AutorDerArbeit{Vorname Nachname}
\Abteilung{Abteilung}
\Firma{Unternehmensname}
\Anschrift{Straße Hausnummer}
\PLZ{PLZ Ort}
\Kurs{Kursbezeichnung}
\Studienrichtung{Studienrichtung}
\Matrikelnummer{1234567}
\Studiengangsleiter{Name}
\WissBetreuer{Name}
\FirmenBetreuer{Name}
\Bearbeitungszeitraum{TT.MM.JJJJ - TT.MM.JJJJ}
\Abgabedatum{TT.MM.JJJJ}
```

- Logos/Signatur für Titel-/Sperr-/Erklärung-Seiten liegen in `Abbildungen/` und werden dort referenziert.
- Hinweis: Die Datei `Abbildungen/09_signature.png` ist eine Vorlage und kann durch eure eigene Unterschrift ersetzt werden. Wenn ihr später selbst unterschreibt, könnt ihr die Signatur-Einbindung vorübergehend auskommentieren oder entfernen.
- Passe bei Bedarf die Texte in `01_deckblatt.tex`, `02_sperrvermerk.tex` und `02_autorenschaft.tex` an (z. B. Datum/Ort, Hinweise, Formulierungen).

## Inhalt schreiben (Kapitel/Abschnitte)

- In `main.tex` sind bereits erste Abschnitte angelegt (Einleitung mit Unterabschnitten). Beispiel:

```tex
\section{Einleitung}
\subsection{Unternehmens- und Abteilungsübersicht}
\input{Text/01_haupt_text/00_einleitung/01_unternehmensuebersicht.tex}
\subsection{Motivation und Forschungsziele}
\subsection{Forschungsfrage}
\subsection{Methodischer Überblick}
\subsection{Aufbau der Arbeit}
```

Optionen für deinen Workflow:
- Lege neue Dateien und Ordner unter `Text/01_haupt_text/...` an und binde sie mit `\input{...}` ein.
- Oder schreibe den Text direkt in `main.tex` in die vorgesehenen Abschnitte.

Tipp: Benenne Ordner/Dateien klar nach Kapiteln (z. B. `02_methodology/00_overview.tex`) und füge in `main.tex` entsprechende `\section{...}`/`\subsection{...}` und `\input{...}` ein.

## Zitieren und Literatur (BibTeX/Natbib)

- Literaturdaten kommen in `literatur.bib` (Beispiel ist enthalten).
- In `Text/02_nach_text/01_literaturverzeichnis.tex` sind Stil und Einbindung gesetzt:

```tex
\bibliographystyle{apalike}
\bibliography{literatur}
```

- Zitieren mit `natbib`:
  - Autor-Jahr im Text: `\citet{schluessel}` → Mustermann (2024)
  - Autor-Jahr in Klammern: `\citep{schluessel}` → (Mustermann, 2024)

## Abbildungen und Tabellen einfügen

Lege Grafiken in `Abbildungen/` ab und nutze z. B.:

```tex
\begin{figure}[H]
  \centering
  \includegraphics[width=0.9\linewidth]{Abbildungen/meine_abbildung.pdf}
  \caption{Aussagekräftige Bildunterschrift}
  \label{fig:meine-abbildung}
\end{figure}
```

Verweise im Text mit `Abbildung~\ref{fig:meine-abbildung}`. Die Verzeichnisse für Abbildungen/Tabellen werden automatisch über `05_listen.tex` erzeugt.

Abkürzungsverzeichnis pflegen in `Text/00_vor_text/05_listen.tex` (Tabellenstruktur erweitern, z. B.):

```tex
AI & Artificial Intelligence \\
ML & Machine Learning \\
```

## Nützliche Hinweise

- Sprache: In `00_packages.tex` ist `\usepackage[ngerman]{babel}` bereits gesetzt (deutsche Bezeichnungen & Silbentrennung).

- Zeilennummern: Paket `lineno` ist eingebunden. Lokal aktivieren/deaktivieren mit `\linenumbers` bzw. `\nolinenumbers`.
- Zeilenabstand: Über `\setstretch{1.5}` in `00_packages.tex` gesetzt (Doppelzeiligkeit für Arbeiten).
- Ränder: In `00_packages.tex` via `geometry` konfiguriert.

## 📋 Weitere Tipps und LaTeX-Befehle

Für eine umfassende Übersicht der wichtigsten LaTeX-Befehle, Formatierungstipps und bewährte Praktiken für Projektarbeiten, siehe die **[CHEAT_SHEET.md](CHEAT_SHEET.md)**.

Die Cheat Sheet enthält:
- Erweiterte Formatierungsbefehle
- Tipps für professionelle Darstellung
- Häufige Fehler und wie man sie vermeidet
- Spezielle Befehle für wissenschaftliche Arbeiten
