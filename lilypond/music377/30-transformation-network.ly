\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Transformation network: A->B->C->D by T3 each step
  % A={0,1,4,6}, B=T3={3,4,7,9}, C=T6={6,7,10,0}, D=T9={9,10,1,3}
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <c' des' e' fis'>1^\markup { \tiny "A {0146}" }
      <ees' e' g' a'>1^\markup { \tiny "B=T₃A {3479}" }
      <fis' g' bes' c''>1^\markup { \tiny "C=T₆A {670(10)}" }
      <a' bes' des'' ees''>1^\markup { \tiny "D=T₉A {9(10)13}" }
    }
  }
  \layout { }
}
