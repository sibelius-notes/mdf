\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \tempo "Proximity: close notes group"
    c'8^\markup { \small "Group A" } d'8 e'8 f'8
    c''8^\markup { \small "Group B" } d''8 e''8 f''8 |
    c'4 r4 c''4 r4 |
  }
  \layout { }
}
