\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { c1:7 f1:7 g1:7 }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % I7–IV7–V7: all dominant sevenths as in blues
        <e' g' bes'>1 <f' a' ees''>1 <g' b' f''>1
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        c1 f,1 g,1
      }
    >>
  >>
  \layout { }
}
