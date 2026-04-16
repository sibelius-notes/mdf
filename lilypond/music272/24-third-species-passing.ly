\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      e'4 d' c' b | c'4 d' e' f' | g'4 f' e' d' | c'1
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      c1 | e1 | g1 | c1
      \bar "|."
    }
  >>
  \layout { }
}
