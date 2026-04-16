\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 11\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/2
      \omit Score.BarNumber
      b2_\markup { \small "7–6 suspension" } a2
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 2/2
      c2 c2
      \bar "|."
    }
  >>
  \layout { }
}
