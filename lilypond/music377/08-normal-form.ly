\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Normal form of {3,7,10,2}: rotations shown, normal form [2,3,7,10]
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      % Unordered set
      <d' ees' g' bes'>1^\markup { \tiny "{2,3,7,10}" }
      \bar "||"
      % Normal form ascending: D Eb G Bb
      d'1^\markup { \tiny "D" }
      ees'1^\markup { \tiny "E♭" }
      g'1^\markup { \tiny "G" }
      bes'1^\markup { \tiny "B♭" }
    }
  }
  \layout { }
}
