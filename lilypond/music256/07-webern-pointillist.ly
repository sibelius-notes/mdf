\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Webern pointillist style — Klangfarbenmelodie, sparse
upper = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % bar 1 — 2-3 isolated notes, large leaps, varied dynamics
  r4 b''8\ppp r8 r4 fis,,8\pp r8 |
  % bar 2 — more sparse
  r2 d'''8\p r8 r4 |
  % bar 3 — single notes with space
  gis,,8\ppp r4. r4 a'''8\pp r8 |
  % bar 4 — fading out
  r2 r4 c,,,,8\ppp r8 |
}
lower = \relative c {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % responding single notes — pizzicato style
  e8^\markup { \small "Klangfarbenmelodie" } r4. r2 |
  r4 cis'8\pp r8 r2 |
  r2 f,,8\ppp r4. |
  b'''8\p r4. r2 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
