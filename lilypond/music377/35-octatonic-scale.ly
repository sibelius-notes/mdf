\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Octatonic scale {0,1,3,4,6,7,9,10}: Messiaen Mode 2
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      c'4 des'4 ees'4 e'4 fis'4 g'4 a'4 bes'4 c''2
      \bar "||"
      <c' des' ees' e' fis' g' a' bes'>1^\markup { \tiny "{0,1,3,4,6,7,9,10} Mode 2" }
    }
  }
  \layout { }
}
