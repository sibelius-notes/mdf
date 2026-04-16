\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Symmetrical sets: whole-tone, dim7, augmented
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      % Whole-tone scale {0,2,4,6,8,10}
      <c' d' e' fis' gis' ais'>1^\markup { \tiny "Whole-tone T₂,T₄,T₆,T₈,T₁₀" }
      \bar "||"
      % Dim7 {0,3,6,9}
      <c' ees' fis' a'>1^\markup { \tiny "Dim7 T₃,T₆,T₉" }
      \bar "||"
      % Augmented triad {0,4,8}
      <c' e' gis'>1^\markup { \tiny "Aug T₄,T₈" }
    }
  }
  \layout { }
}
