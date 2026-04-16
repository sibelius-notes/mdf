\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c''1^"I" a'4^"IV" g'4 e'4 c''4^"I (Plagal)" \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,1 f,4 f,4 f,4 c,4
    }
  >>
  \layout { }
}
