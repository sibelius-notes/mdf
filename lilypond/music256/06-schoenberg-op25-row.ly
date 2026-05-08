\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schoenberg Op.25 Piano Suite — P0 row + I5 inversion (simplified)
% P0 first hexachord: E-F-G-Db-Gb-Eb
upper = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % bar 1 — P0 row first hexachord as 8th-note melody
  e8^\markup { \small "P0 row →" } f g des fis es r4 |
  % bar 2 — P0 second hexachord
  e8 f g des fis es r4 |
  % bar 3 — row fragment continued
  des8 c bes e b d r4 |
  % bar 4 — final statement
  r4 e8 f g des fis8. es16 |
}
lower = \relative c {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % I5 inversion (transposition of inversion): Bb-A-G-C#-G#-B
  bes8^\markup { \small "I5 inversion ↓" } a g cis gis b r4 |
  bes8 a g cis gis b r4 |
  cis8 d e bes e c r4 |
  r4 bes8 a g cis gis8. b16 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
