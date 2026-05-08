\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Polyrhythm 3 against 2: triplet 8th-notes in treble (3 per beat)
% vs regular 8th-notes in bass (2 per beat) — written out explicitly
upper = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 2/4
  % Right hand: triplet 8ths — 3 notes per beat (6 per bar)
  \tuplet 3/2 { c8^\markup { \tiny "3" } e g }
  \tuplet 3/2 { c,8 e g } |
  \tuplet 3/2 { d8 f a }
  \tuplet 3/2 { d,8 f a } |
  \tuplet 3/2 { e8 g b }
  \tuplet 3/2 { c,8 e g } |
  \tuplet 3/2 { c,8 e g }
  \tuplet 3/2 { c,8 e g } |
}
lower = \relative c {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 2/4
  % Left hand: regular 8th-notes — 2 per beat (4 per bar)
  c8_\markup { \tiny "2" } g' c g |
  d8 a' d a |
  e8 b' e b |
  c,8 g' c g |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
