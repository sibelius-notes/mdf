\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Major triad and minor triad: same interval vector <001110>
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <c' e' g'>1^\markup { \tiny "C major {0,4,7}" }
      <c' ees' g'>1^\markup { \tiny "C minor {0,3,7}" }
    }
  }
  \layout { }
}
