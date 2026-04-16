\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Secondary dominant cycle in C: A7 - Dm7 - D7 - G7 - C7 - Fmaj7
\score {
  <<
    \new ChordNames {
      \chordmode { a1:7 d1:m7 d1:7 g1:7 c1:7 f1:maj7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <a cis e g>1
      <d f a c'>1
      <d fis a c'>1
      <g b d' f'>1
      <c e g bes>1
      <f a c' e'>1
    }
  >>
  \layout { }
}
