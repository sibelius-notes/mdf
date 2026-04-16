\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 11\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      << { e'2^\markup { \bold "✗" \small " voice crossing" } d'2 }
         \\ { g'2 c'2 } >>
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      c2 g,2
    }
  >>
  \layout { }
}
