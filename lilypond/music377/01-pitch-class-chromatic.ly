\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    % All 12 pitch classes: C C# D D# E F F# G G# A Bb B
    c'1 cis'1 d'1 dis'1 e'1 f'1 fis'1 g'1 gis'1 a'1 bes'1 b'1
  }
  \layout { }
}
