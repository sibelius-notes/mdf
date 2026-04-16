\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tritone-sub turnaround: Cmaj7 - Eb7 - Dm7 - Db7
\score {
  <<
    \new ChordNames {
      \chordmode { c2:maj7 ees2:7 d2:m7 des2:7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c e g b>2 <ees g bes des'>2
      <d f a c'>2 <des f aes ces'>2
    }
  >>
  \layout { }
}
