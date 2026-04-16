\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 11\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      e'4_\markup { \small "E–F–D–E (double neighbor)" } f' d' e'
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      c1
      \bar "|."
    }
  >>
  \layout { }
}
