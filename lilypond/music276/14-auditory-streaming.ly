\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \tempo "Fast (♩=160)"
    e''8^\markup { \small "High stream" } c'8_\markup { \small "Low stream" }
    e''8 c'8 e''8 c'8 e''8 c'8 |
    g''8 d'8 g''8 d'8 g''8 d'8 g''8 d'8 |
    e''8 c'8 e''8 c'8 e''8 c'8 e''8 c'8 |
  }
  \layout { }
}
