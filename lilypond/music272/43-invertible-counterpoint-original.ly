\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      g'1^\markup { \small "original" } a'1 f'1 g'1
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      e1 f1 d1 e1
      \bar "|."
    }
  >>
  \layout { }
}
