\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 3.6 — Foreground graph: actual melody with passing tones labeled
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Full foreground melody in C major
    e''2^"3̂" f''4_"PT" g''4
    a''4 g''4 f''4_"PT" e''4^"3̂"
    d''2^"2̂" e''4_"NT" d''4^"2̂"
    c''1^"1̂"
  }
  \layout { }
}
