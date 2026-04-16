\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 12\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/2
      \omit Score.BarNumber
      e'2_\markup { \small "nota cambiata: E–D–B–C" } d'2 | b2 c'2
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 2/2
      c1 g,1
      \bar "|."
    }
  >>
  \layout { }
}
