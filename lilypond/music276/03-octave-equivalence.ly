\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef bass \key c \major \time 5/4
    \omit Score.BarNumber
    c,1^\markup { \small "C2 (65 Hz)" }
    c1^\markup { \small "C3 (131 Hz)" }
    \clef treble
    c'1^\markup { \small "C4 (262 Hz)" }
    c''1^\markup { \small "C5 (523 Hz)" }
    c'''1^\markup { \small "C6 (1047 Hz)" }
  }
  \layout { }
}
