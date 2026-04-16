\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c''4 d'' e'' f''
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      g4 f g c
    }
  >>
  \layout { }
}
