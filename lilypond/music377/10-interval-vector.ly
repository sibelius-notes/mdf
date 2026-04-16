\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Major triad {0,4,7} interval vector <001110>
  % Show three pairs: {0,4} ic4, {4,7} ic3, {0,7} ic5
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <c' e'>1^\markup { \tiny "ic 4 (M3)" }
      <e' g'>1^\markup { \tiny "ic 3 (m3)" }
      <c' g'>1^\markup { \tiny "ic 5 (P5)" }
      \bar "||"
      <c' e' g'>1^\markup { \tiny "{0,4,7} IV: ⟨001110⟩" }
    }
  }
  \layout { }
}
