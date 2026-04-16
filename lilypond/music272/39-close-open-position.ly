\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 12\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      << { e''2^\markup { \small "close" } } \\ { c'2 } \\ { g'2 } >> r2
      << { c''2^\markup { \small "open" } } \\ { e'2 } \\ { g'2 } >> r2
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      c2 r2 | c2 r2
    }
  >>
  \layout { }
}
