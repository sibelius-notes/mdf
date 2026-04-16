\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Definition 3.1 — Linear Progression (Zug): descending fifth-progression (Quintzug)
% Structural endpoints open, passing tones filled, beamed above
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Quintzug: g''→c'' (5th), beam connects the group
    \override Beam.positions = #'(3.5 . 3.5)
    g''2^"5̂" f''4^"4̂" e''4^"3̂"
    d''2^"2̂" c''2^"1̂"
  }
  \layout { }
}
