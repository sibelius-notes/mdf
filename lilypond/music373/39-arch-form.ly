\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% Bartók arch form ABCBA sketch
    c''2^"A" e''2 |
    g''2^"B" b''2 |
    dis'''2^"C (apex)" cis'''2 |
    g''2^"B'" b''2 |
    c''2^"A'" e''2 \bar "|."
  }
  \layout { }
}
