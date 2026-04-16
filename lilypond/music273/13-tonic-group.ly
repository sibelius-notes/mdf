\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { c1:maj7 e1:m7 a1:m7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Tonic group: Imaj7, IIIm7, VIm7
      <c e g b>1
      <e g b d'>1
      <a c' e' g'>1
    }
  >>
  \layout { }
}
