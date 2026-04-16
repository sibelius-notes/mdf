\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' e' g'>1^\markup { \small "Just major triad C:E:G = 4:5:6" }
    <c' e' g'>1^\markup { \small "12-TET: E is +13.7¢ sharp" }
    <c' e' g' c''>1^\markup { \small "With octave doubling" }
  }
  \layout { }
}
