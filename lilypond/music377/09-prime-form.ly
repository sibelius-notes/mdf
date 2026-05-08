\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Finding prime form: passage → normal form → transpose to 0 → prime form
% Set {2,3,7,10}: normal form [2,3,7,10], prime form (0,1,5,8)
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 3/4
      % Bar 1: musical gesture using the set
      d'8^\markup { \tiny "pc 2" }
      ees'8^\markup { \tiny "pc 3" }
      g'4^\markup { \tiny "pc 7" }
      bes'4^\markup { \tiny "pc 10" }
      |
      % Bar 2: show normal form [2,3,7,10] as ascending line
      d'4^\markup { \tiny "[2" }
      ees'4^\markup { \tiny "3" }
      g'4^\markup { \tiny "7" }
      |
      bes'2^\markup { \tiny "10]  normal form" }
      r4
      |
      % Bar 3: subtract 2 → prime form [0,1,5,8]
      c'4^\markup { \tiny "(0" }
      des'4^\markup { \tiny "1" }
      f'4^\markup { \tiny "5" }
      |
      aes'2^\markup { \small "(0,1,5,8)  prime form" }
      r4
    }
  }
  \layout { }
}
