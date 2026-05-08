\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Minimalist phase pattern (Reich style): same repeating figure in both staves
% offset by one 8th-note — Piano Phase (1967) -style illustration
upper = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 12/8
  % Upper: original pattern starting on beat 1
  e8^\markup { \tiny "pattern 1 (phase 0)" }
  fis8 b8 cis8 d8 fis8 e8 fis8 b8 cis8 d8 fis8 |
  e8 fis8 b8 cis8 d8 fis8 e8 fis8 b8 cis8 d8 fis8 |
}
lower = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 12/8
  % Lower: same pattern offset by one 8th-note — the "phase" relationship
  r8_\markup { \tiny "pattern 2 (+1 phase)" }
  e8 fis8 b8 cis8 d8 fis8 e8 fis8 b8 cis8 d8 |
  fis8 e8 fis8 b8 cis8 d8 fis8 e8 fis8 b8 cis8 d8 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
