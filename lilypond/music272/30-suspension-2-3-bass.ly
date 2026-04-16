\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 11\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/2
      \omit Score.BarNumber
      e'2_\markup { \small "2–3 bass suspension" } e'2
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 2/2
      d2 c2
      \bar "|."
    }
  >>
  \layout { }
}
