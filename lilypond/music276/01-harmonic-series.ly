\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef bass \key c \major \time 8/4
    \omit Score.BarNumber
    c,1^\markup { \small "C2 (65 Hz) 1st" }
    c^\markup { \small "C3 (131 Hz) 2nd" }
    g^\markup { \small "G3 (196 Hz) 3rd" }
    \clef treble
    c'^\markup { \small "C4 (262 Hz) 4th" }
    e'^\markup { \small "E4 (327 Hz) 5th" }
    g'^\markup { \small "G4 (393 Hz) 6th" }
    bes'^\markup { \small "Bb4 (458 Hz) 7th" }
    c''^\markup { \small "C5 (523 Hz) 8th" }
  }
  \layout { }
}
