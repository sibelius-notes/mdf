\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Hexatonic PL cycle: C maj -> C min -> Ab maj -> Ab min -> E maj -> E min -> C maj
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <c' e' g'>1^\markup { \tiny "C maj" }
      <c' ees' g'>1^\markup { \tiny "P→C min" }
      <aes ees' aes'>1^\markup { \tiny "L→A♭ maj" }
      <aes ees' aes'>1^\markup { \tiny "P→A♭ min" }
      % Ab minor: {8,11,3}={Ab,B,Eb}
      <aes, b ees'>1
      <e' gis' b'>1^\markup { \tiny "L→E maj" }
      <e' g' b'>1^\markup { \tiny "P→E min" }
    }
  }
  \layout { }
}
