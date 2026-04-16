\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    % i(0,4)=4 major third, i(4,0)=8 minor sixth
    % i(9,2)=5 perfect fourth, i(11,3)=4 major third
    \relative c' {
      c'1 e'1 \bar "||"
      e'1 c''1 \bar "||"
      a1 d''1 \bar "||"
      b1 ees''1
    }
  }
  \layout { }
}
