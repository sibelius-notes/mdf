\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Hexatonic PL cycle with chord symbol names above each chord
% C maj → C min → Ab maj → Ab min → E maj → E min → C maj
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      \time 4/4
      <c' e' g'>2^\markup { \column { \tiny "C" \tiny "P↓" } }
      <c' ees' g'>2^\markup { \column { \tiny "Cm" \tiny "L↓" } }
      |
      <aes ees' aes'>2^\markup { \column { \tiny "A♭" \tiny "P↓" } }
      <aes ees' aes'>2
      |
      % Ab minor: {8,11,3} = Ab B Eb
      <aes, b ees'>2^\markup { \column { \tiny "A♭m" \tiny "L↓" } }
      <e' gis' b'>2^\markup { \column { \tiny "E" \tiny "P↓" } }
      |
      <e' g' b'>2^\markup { \column { \tiny "Em" \tiny "→C" } }
      <c' e' g'>2^\markup { \tiny "C" }
    }
  }
  \layout { }
}
