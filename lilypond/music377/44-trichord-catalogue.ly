\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % All 12 trichord set classes
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <c' des' d'>1^\markup { \tiny "[3-1]" }
      <c' des' ees'>1^\markup { \tiny "[3-2]" }
      <c' des' e'>1^\markup { \tiny "[3-3]" }
      <c' des' f'>1^\markup { \tiny "[3-4]" }
      <c' des' fis'>1^\markup { \tiny "[3-5]" }
      <c' d' e'>1^\markup { \tiny "[3-6]" }
      <c' d' f'>1^\markup { \tiny "[3-7]" }
      <c' d' fis'>1^\markup { \tiny "[3-8]" }
      <c' d' g'>1^\markup { \tiny "[3-9]" }
      <c' ees' fis'>1^\markup { \tiny "[3-10]" }
      <c' ees' g'>1^\markup { \tiny "[3-11]" }
      <c' e' gis'>1^\markup { \tiny "[3-12]" }
    }
  }
  \layout { }
}
