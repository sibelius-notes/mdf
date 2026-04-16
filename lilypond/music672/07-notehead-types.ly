\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 3.2 — Open vs. filled noteheads in Schenkerian graphs
% Shows structural (open) and elaborating (filled) noteheads side by side
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Open noteheads for structural tones (whole notes)
    e''1^"structural (open)"
    % Filled noteheads for elaborating tones (quarter notes)
    e''4_"elaborating (filled)" f'' g'' f''
    e''1^"structural return"
  }
  \layout { }
}
