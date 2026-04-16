\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { e1:m7 a1:m7 d1:m7 g1:7 c1:maj7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <e g b d'>1
      <a c' e' g'>1
      <d f a c'>1
      <g b d' f'>1
      <c e g b>1
    }
  >>
  \layout { }
}
