\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { d1:m7 f1:maj7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Subdominant group: IIm7, IVmaj7
      <d f a c'>1
      <f a c' e'>1
    }
  >>
  \layout { }
}
