\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % PLR transformations on C major
  % C major {0,4,7}
  % P: C minor {0,3,7}
  % L: E minor {4,7,11}
  % R: A minor {9,0,4}
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <c' e' g'>1^\markup { \tiny "C major" }
      <c' ees' g'>1^\markup { \tiny "P → C minor" }
      <e' g' b'>1^\markup { \tiny "L → E minor" }
      <a c' e'>1^\markup { \tiny "R → A minor" }
    }
  }
  \layout { }
}
