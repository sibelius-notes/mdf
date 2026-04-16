\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      e'1^\markup { \small "inverted" } f'1 d'1 e'1
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      g,1 a,1 f,1 g,1
      \bar "|."
    }
  >>
  \layout { }
}
