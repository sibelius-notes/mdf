\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Pierrot Lunaire "Mondestrunken": [3-11] and [3-8] alternating
  % {4,7,11} = E G B (minor triad), {4,6,10} = E F# Bb [3-8]
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      % m.1: B G E (right hand descending)
      b'4^\markup { \tiny "B(11)" }
      g'4^\markup { \tiny "G(7)" }
      e'4^\markup { \tiny "E(4)" }
      r4
      \bar "||"
      <e' g' b'>1^\markup { \tiny "{4,7,11} [3-11]" }
      <e' fis' bes'>1^\markup { \tiny "{4,6,10} [3-8]" }
    }
  }
  \layout { }
}
