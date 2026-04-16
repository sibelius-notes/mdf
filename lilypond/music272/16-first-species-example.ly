\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 1/1
      \omit Score.BarNumber
      e'1 f'1 a'1 g'1 f'1 e'1
      \bar "|."
    }
    \new Staff {
      \clef tenor \key c \major \time 1/1
      c1 d1 f1 e1 d1 c1
      \bar "|."
    }
  >>
  \layout { }
}
