\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schumann Charakterstück style — A minor, 4/4, innig
upper = \relative c'' {
  \clef treble
  \key a \minor
  \time 4/4
  \omit Score.BarNumber
  % bar 1 — improvisatory opening with unexpected rest
  a4\p^\markup { \italic "innig" } c8 b r4 e8 d |
  % bar 2 — off-beat accent, question-mark ending
  c4\sf r8 a b4 c~ |
  % bar 3 — flowing but interrupted
  c8 b a4 r4 f'8 e |
  % bar 4 — wistful close
  d4\> c8 b a4 r4\! |
  % bar 5 — returns to opening idea varied
  a4 c8 b a4 e'~ |
  % bar 6 — descending sequence
  e8\p d c b a4 r4 |
  % bar 7 — fragmentary, pausing
  r4 e'4\sf r8 d c4 |
  % bar 8 — close on tonic
  <a c e>2.\p r4 |
}
lower = \relative c {
  \clef bass
  \key a \minor
  \time 4/4
  \omit Score.BarNumber
  % simple harmonic support
  <a c e>2 <g b d>2 |
  <a c>2 <e b' e>2 |
  <a c e>2 <f c' f>2 |
  <e b' e>2 r2 |
  <a c e>2 <e b' e>2 |
  <a c e>2 r2 |
  <g b e>2 <a c e>2 |
  <a, e' a>2. r4 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
