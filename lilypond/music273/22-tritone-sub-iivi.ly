\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tritone substitution: Dm7 - Db7 - Cmaj7 (Db7 substitutes G7)
\score {
  <<
    \new ChordNames {
      \chordmode { d1:m7 des1:7 c1:maj7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <d f a c'>1
      <des f aes ces'>1
      <c e g b>1
    }
  >>
  \layout { }
}
