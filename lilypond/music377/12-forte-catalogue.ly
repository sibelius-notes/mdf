\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Key set classes from Forte's catalogue
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      % [3-1] (012) chromatic
      <c' des' d'>1^\markup { \tiny "[3-1] (012)" }
      % [3-11] (037) triad
      <c' ees' g'>1^\markup { \tiny "[3-11] (037)" }
      % [4-28] (0369) dim7
      <c' ees' fis' a'>1^\markup { \tiny "[4-28] (0369)" }
      % [6-35] whole-tone
      <c' d' e' fis' gis' ais'>1^\markup { \tiny "[6-35] whole-tone" }
    }
  }
  \layout { }
}
