\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode {
        c1:maj7 d1:m7 e1:m7 f1:maj7 g1:7 a1:m7 b1:m7.5-
      }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c e g b>1
      <d f a c'>1
      <e g b d'>1
      <f a c' e'>1
      <g b d' f'>1
      <a c' e' g'>1
      <b d' f' a'>1
    }
  >>
  \layout { }
}
