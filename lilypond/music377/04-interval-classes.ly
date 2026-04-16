\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    % Six interval classes ic1 through ic6 shown as dyads
    \relative c' {
      <c' des'>1^\markup { \tiny "ic 1" }
      <c' d'>1^\markup { \tiny "ic 2" }
      <c' ees'>1^\markup { \tiny "ic 3" }
      <c' e'>1^\markup { \tiny "ic 4" }
      <c' f'>1^\markup { \tiny "ic 5" }
      <c' fis'>1^\markup { \tiny "ic 6" }
    }
  }
  \layout { }
}
