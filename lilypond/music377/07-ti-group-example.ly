\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % T_3I(9) = F# (6); T_7 applied to C major
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      % A (9) under T_3I -> F# (6)
      a'1^\markup { \tiny "A (pc 9)" }
      fis'1^\markup { \tiny "T₃I(9)=F♯" }
      \bar "||"
      % C major under T_7 -> G major
      <c' e' g'>1^\markup { \tiny "C major" }
      <g' b' d''>1^\markup { \tiny "T₇ → G major" }
    }
  }
  \layout { }
}
