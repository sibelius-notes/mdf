\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% "So What" vamp: D Dorian (A section) then Eb Dorian (B section)
\score {
  <<
    \new ChordNames {
      \chordmode { d2:m7 d2:m7 ees2:m7 ees2:m7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % D Dorian chord
      <d f a c'>2 <d f a c'>2
      % Eb Dorian chord
      <ees ges bes des'>2 <ees ges bes des'>2
    }
  >>
  \layout { }
}
