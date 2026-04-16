\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'1^\markup { \small "Pure tone: C4 only (262 Hz)" }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c' e' g' c''>1^\markup { \small "Complex tone: C4 + harmonics" }
    }
  >>
  \layout { }
}
