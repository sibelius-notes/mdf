\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { d1:m7 g1:7 }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Hip-hop loop: minor ii7–V7 vamp
        <f' a' c''>1 | <g' b' d'' f''>1 |
        <f' a' c''>1 | <g' b' d'' f''>1 |
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        d1 | g,1 |
        d1 | g,1 |
      }
    >>
  >>
  \layout { }
}
