\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 10\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      g'2^\markup { \small "M6 → P8" } c''2
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      b,2 c2
      \bar "|."
    }
  >>
  \layout { }
}
