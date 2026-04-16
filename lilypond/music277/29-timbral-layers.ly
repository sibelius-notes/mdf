\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new StaffGroup <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Lead vocal — high register, mp
      \set Staff.instrumentName = "Lead"
      \dynamicUp
      g'2\mp a'2 | c''1 |
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Guitar pad — middle register, pp
      \set Staff.instrumentName = "Gtr"
      \dynamicUp
      <e' g' c''>1\pp | <e' g' c''>1 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % Bass — low register, mf
      \set Staff.instrumentName = "Bass"
      \dynamicUp
      c,2.\mf g,,4 | c,1 |
    }
  >>
  \layout { }
}
