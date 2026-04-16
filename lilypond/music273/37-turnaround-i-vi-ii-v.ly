\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Standard turnaround in C: Cmaj7 - A7 - Dm7 - G7
\score {
  <<
    \new ChordNames {
      \chordmode { c2:maj7 a2:7 d2:m7 g2:7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c e g b>2 <a cis e g>2
      <d f a c'>2 <g b d' f'>2
    }
  >>
  \layout { }
}
