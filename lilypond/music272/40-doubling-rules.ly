\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      << { c''2^\markup { \small "root doubled ✓" } } \\ { e'2 } \\ { g'2 } >>
      << { b'2^\markup { \small "LT doubled ✗" } } \\ { g'2 } \\ { d'2 } >>
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      c2 g,2
    }
  >>
  \layout { }
}
