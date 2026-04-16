\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    % Z_12 clock: 0=C, 1=C#, 2=D ... 11=B, then back to C an octave up
    c'1 cis'1 d'1 dis'1 e'1 f'1 fis'1 g'1 gis'1 a'1 bes'1 b'1 c''1
  }
  \layout { }
}
