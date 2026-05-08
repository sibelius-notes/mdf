\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Normal form: musical passage → identify set → find normal order
% Set {2,3,7,10} = D Eb G Bb, normal form [2,3,7,10]
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 4/4
      % Bar 1: the passage — motivic gesture using all four PCs
      d'8^\markup { \tiny "2" }
      ees'8^\markup { \tiny "3" }
      g'4^\markup { \tiny "7" }
      bes'4^\markup { \tiny "10" }
      r4
      |
      % Bar 2: circle the pitches — show set in normal order
      % Normal form ascending: D(2) Eb(3) G(7) Bb(10)
      % Outer interval: 10−2 = 8 semitones
      d'4^\markup { \tiny "D (2)" }
      ees'4^\markup { \tiny "E♭ (3)" }
      g'4^\markup { \tiny "G (7)" }
      bes'4^\markup { \tiny "B♭ (10)" }
      |
      % Bar 3: normal form as ordered set label
      <d' ees' g' bes'>2^\markup { \small "[2,3,7,10]  outer int = 8" }
      r2
    }
  }
  \layout { }
}
