\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { c1 e1:7 a1:m f1 g1 c1 }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % I – V/vi – vi – IV – V – I: secondary dominant
        e'1 gis'1 a'1 f'1 g'1 c''1
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        <c e g>1 <e, gis, b, d>1 <a, c e>1 <f, a, c>1 <g, b, d>1 <c e g>1
      }
    >>
  >>
  \layout { }
}
