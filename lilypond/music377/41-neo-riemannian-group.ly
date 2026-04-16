\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % LR chain: C major -> E minor -> G major -> B minor -> D major -> F# minor
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <c' e' g'>2^\markup { \tiny "C maj" }
      <e' g' b'>2^\markup { \tiny "L→E min" }
      <g' b' d''>2^\markup { \tiny "R→G maj" }
      <b' d'' fis''>2^\markup { \tiny "L→B min" }
      <d'' fis'' a''>2^\markup { \tiny "R→D maj" }
      <fis'' a'' cis'''>2^\markup { \tiny "L→F♯ min" }
    }
  }
  \layout { }
}
