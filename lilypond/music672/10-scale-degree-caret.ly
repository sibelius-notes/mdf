\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 3.5 — Caret notation: scale-degree labels on Urlinie tones
\score {
  \new Staff {
    \clef treble \key c \major \time 5/4 \omit Score.BarNumber
    % Fifth-line Urlinie with caret labels
    g''1^"5̂" f''1^"4̂" e''1^"3̂" d''1^"2̂" c''1^"1̂"
  }
  \layout { }
}
