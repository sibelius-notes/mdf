\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 1/1
      \omit Score.BarNumber
      g'1^\markup { \italic "independent counterpoint — contrary motion" } g'1 c'1 c'1 d'1
    }
    \new Staff {
      \clef bass \key c \major \time 1/1
      c1 d1 e1 f1 g1
    }
  >>
  \layout { }
}
