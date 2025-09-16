### Vor dem Start: Vorschau aktivieren
Tippe in diese Datei und drücke Cmd+Shift+V (macOS) bzw. Ctrl+Shift+V (Windows/Linux), um die Markdown‑Vorschau zu öffnen. Es öffnet sich eine neue Ansicht – nutze sie für die formatierte, besser lesbare Darstellung.

# 📚 LaTeX Cheat Sheet für Projektarbeiten

*Eine umfassende Sammlung von LaTeX-Befehlen, Tipps und bewährten Praktiken für Studierende*

---

## 🎯 Grundlegende Formatierung

### Überschriften und Gliederung
```tex
\section{Erste Gliederungsebene}
\subsection{Zweite Gliederungsebene}
\subsubsection{Dritte Gliederungsebene}
\paragraph{Absatzüberschrift}
\subparagraph{Unterabsatzüberschrift}
```

### Text-Styling
```tex
\gqq{Deutsche Anführungszeichen}
\textbf{Fettgedruckt}
\textit{Kursiv}
\underline{Unterstrichen}
\texttt{Schreibmaschinenschrift}
\emph{Betonung}
\\                              % Manueller Zeilenumbruch
\myboxquote{Hervorgehobenes Zitat in einer Box}
```

### Abstände und Formatierung
```tex
\vspace{5mm}                    % Vertikaler Abstand
\hspace{10mm}                   % Horizontaler Abstand
\newpage                        % Neue Seite
\clearpage                      % Neue Seite + alle Floats ausgeben
\noindent                       % Keine Einrückung am Absatzanfang
```

---

## 🔗 Referenzen und Verweise

### Labels und Referenzen
```tex
\label{sec:einleitung}          % Label für Abschnitt setzen
\label{fig:diagramm}            % Label für Abbildung setzen
\label{tab:ergebnisse}          % Label für Tabelle setzen

\ref{sec:einleitung}            % Verweis auf Abschnittsnummer
\pageref{fig:diagramm}          % Verweis auf Seitenzahl
\mypageref{tab:ergebnisse}      % Verweis mit "S." vor Seitenzahl

% Bessere Verweise (falls hyperref geladen):
\autoref{sec:einleitung}        % Automatischer Verweis mit Typ
```

### Fußnoten
```tex
\footnote{Text der Fußnote}
\footnotemark[1]                % Nur die Markierung
\footnotetext[1]{Text der Fußnote} % Nur der Text
```

---

## 📝 Listen und Aufzählungen

### Einfache Listen
```tex
\begin{itemize}
    \item Erster Punkt
    \item Zweiter Punkt
    \begin{itemize}
        \item Unterpunkt
        \item Noch ein Unterpunkt
    \end{itemize}
\end{itemize}
```

### Nummerierte Listen
```tex
\begin{enumerate}
    \item Erster Punkt
    \item Zweiter Punkt
    \begin{enumerate}[a)]        % Buchstaben als Nummerierung
        \item Unterpunkt a
        \item Unterpunkt b
    \end{enumerate}
\end{enumerate}
```

### Beschreibungslisten
```tex
\begin{description}
    \item[Begriff 1] Erklärung des ersten Begriffs
    \item[Begriff 2] Erklärung des zweiten Begriffs
\end{description}
```

---

## 🖼️ Abbildungen und Grafiken

### Einfache Abbildung
```tex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{Abbildungen/meine_grafik.pdf}
    \caption{Aussagekräftige Bildunterschrift}
    \label{fig:meine-grafik}
\end{figure}
```

### Erweiterte Bildoptionen
```tex
% Bild beschneiden und skalieren
\includegraphics[width=0.5\textwidth, trim=5mm 10mm 5mm 10mm, clip]{bild.jpg}

% Bild rotieren
\includegraphics[angle=90, width=0.8\textwidth]{bild.pdf}

% Mehrere Bilder nebeneinander
\begin{figure}[htbp]
    \centering
    \begin{minipage}{0.45\textwidth}
        \centering
        \includegraphics[width=\textwidth]{bild1.pdf}
        \caption{Erstes Bild}
        \label{fig:bild1}
    \end{minipage}
    \hfill
    \begin{minipage}{0.45\textwidth}
        \centering
        \includegraphics[width=\textwidth]{bild2.pdf}
        \caption{Zweites Bild}
        \label{fig:bild2}
    \end{minipage}
\end{figure}
```

---

## 📊 Tabellen

### Einfache Tabelle
```tex
\begin{table}[htbp]
    \centering
    \caption{Meine Tabelle}
    \label{tab:beispiel}
    \begin{tabular}{|l|c|r|}
        \hline
        \textbf{Links} & \textbf{Zentriert} & \textbf{Rechts} \\
        \hline
        Zeile 1 & Wert 1 & 123 \\
        Zeile 2 & Wert 2 & 456 \\
        \hline
    \end{tabular}
\end{table}
```

### Professionelle Tabelle (mit booktabs)
```tex
\begin{table}[htbp]
    \centering
    \caption{Professionelle Tabelle}
    \label{tab:professionell}
    \begin{tabular}{lcc}
        \toprule
        \textbf{Parameter} & \textbf{Wert 1} & \textbf{Wert 2} \\
        \midrule
        Alpha & 0.05 & 0.01 \\
        Beta & 0.20 & 0.10 \\
        Gamma & 0.75 & 0.85 \\
        \bottomrule
    \end{tabular}
\end{table}
```

---

## 📖 Zitieren und Literatur

### Zitierformen (mit natbib)
```tex
\cite{autor2024}                % Autor (2024)
\citep{autor2024}               % (Autor, 2024)
\citet{autor2024}               % Autor (2024)
\citealp{autor2024}             % Autor, 2024
\citealt{autor2024}             % Autor 2024

% Mit Seitenangaben
\citep[S.~15]{autor2024}        % (Autor, 2024, S. 15)
\citep[vgl.][S.~15-20]{autor2024} % (vgl. Autor, 2024, S. 15-20)
```

### Spezielle Zitierformen (falls definiert)
```tex
\vgl{autor2024}                 % Vergleichsverweis
\vgl[15]{autor2024}             % Vergleichsverweis mit Seite
\vgl[13,~46]{autor2024}         % Mehrere Seiten
```

---

## 🧮 Mathematische Formeln

### Inline-Mathematik
```tex
Die Formel $E = mc^2$ ist berühmt.
```

### Abgesetzte Formeln
```tex
\begin{equation}
    F = ma
    \label{eq:newton}
\end{equation}

% Ohne Nummerierung
\begin{equation*}
    \sum_{i=1}^{n} x_i = \bar{x} \cdot n
\end{equation*}
```

### Häufige mathematische Symbole
```tex
\alpha, \beta, \gamma           % Griechische Buchstaben
\sum, \prod, \int               % Summe, Produkt, Integral
\leq, \geq, \neq                % Vergleichsoperatoren
\subset, \subseteq              % Mengenoperatoren
\infty, \partial                % Unendlich, partiell
```

---

## 💻 Code und Listings

### Inline-Code
```tex
\texttt{Code} oder \verb|Code|
```

### Code-Blöcke
```tex
\begin{lstlisting}[language=Python, caption=Python Beispiel, label=lst:python]
def hello_world():
    print("Hello, World!")
    return True
\end{lstlisting}
```

### Code aus Datei einbinden
```tex
\lstinputlisting[language=Java, caption=Java Code]{code/beispiel.java}
```

---

## 🎨 Tipps für professionelle Darstellung

### 1. Konsistente Formatierung
- Verwende einheitliche Schriftgrößen für Abbildungen
- Achte auf konsistente Bezeichnungen (z.B. "Abbildung" vs. "Abb.")
- Nutze einheitliche Farben und Stile

### 2. Qualität der Abbildungen
```tex
% Bevorzuge Vektorformate (PDF, SVG) für scharfe Darstellung
\includegraphics[width=0.8\textwidth]{diagramm.pdf}

% Stelle sicher, dass Text in Abbildungen lesbar ist
\includegraphics[width=\textwidth]{große_tabelle.pdf}
```

### 3. Seitenumbrüche kontrollieren
```tex
% Verhindere Seitenumbruch vor einer Überschrift
\nopagebreak
\section{Wichtiger Abschnitt}

% Erzwinge Seitenumbruch
\newpage

% Verhindere unschöne Umbrüche
\begin{samepage}
Dieser Text soll zusammenbleiben.
\end{samepage}
```

---

## ⚠️ Häufige Fehler vermeiden

### 1. Leerzeichen und Abstände
```tex
% FALSCH:
z.B.das ist falsch
% RICHTIG:
z.\,B. das ist richtig

% FALSCH:
siehe Abbildung3
% RICHTIG:
siehe Abbildung~\ref{fig:beispiel}

% FALSCH:
Forschung & Entwicklung
% RICHTIG:
Forschung \& Entwicklung
```

### 2. Anführungszeichen
```tex
% FALSCH:
"Deutsches Zitat"
% RICHTIG:
\gqq{Deutsches Zitat}
% oder:
\glqq Deutsches Zitat\grqq
```

### 3. Umlaute und Sonderzeichen
```tex
% FALSCH (in älteren LaTeX-Versionen):
Müller, Größe
% BESSER:
M\"uller, Gr\"o\ss e
% HEUTE meist OK dank UTF-8:
Müller, Größe
```

---

## 🚀 Fortgeschrittene Techniken

### Eigene Befehle definieren
```tex
% In der Präambel oder in config.tex:
\newcommand{\myuniversity}{DHBW Mannheim}
\newcommand{\highlight}[1]{\textbf{\textcolor{blue}{#1}}}

% Verwendung:
Ich studiere an der \myuniversity.
Das ist \highlight{wichtig}!
```

### Bedingte Kompilierung
```tex
% Für Entwürfe:
\usepackage{ifdraft}
\ifdraft{
    \usepackage{lineno}
    \linenumbers
}{}
```

### Hyperlinks und PDF-Eigenschaften
```tex
% In der Präambel:
\usepackage[colorlinks=true, linkcolor=black, citecolor=blue]{hyperref}
\hypersetup{
    pdftitle={Titel der Arbeit},
    pdfauthor={Ihr Name},
    pdfsubject={Projektarbeit},
    pdfkeywords={Schlüsselwort1, Schlüsselwort2}
}
```

---

## 🔧 Debugging und Fehlerbehebung

### Häufige Fehlermeldungen
- **Undefined control sequence**: Befehl nicht definiert → Paket laden oder Tippfehler prüfen
- **Missing $ inserted**: Mathematikmodus fehlt → $ vor und nach Formel
- **Runaway argument**: Geschweifte Klammern nicht geschlossen
- **File not found**: Pfad zur Datei prüfen

### Hilfreiche Debug-Befehle
```tex
\listfiles                      % Zeigt geladene Pakete
\errorstopmode                  % Stoppt bei jedem Fehler
\tracingmacros=1               % Zeigt Makro-Expansionen
```

### Textstudio/Editor-Tipps
- Nutze Syntax-Highlighting
- Aktiviere automatische Vervollständigung
- Verwende die Rechtschreibprüfung
- Nutze die Struktur-Ansicht für Navigation

---

*Diese Cheat Sheet wird kontinuierlich erweitert. Bei Fragen oder Ergänzungsvorschlägen, siehe README.md für weitere Informationen.*