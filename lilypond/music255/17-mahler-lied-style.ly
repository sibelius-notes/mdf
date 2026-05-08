\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Mahler song style (Das Lied von der Erde, "Von der Jugend"):
% long lyrical vocal line over sparse piano — wide range, chromatic inflections
vocal = \relative c'' {
  \clef treble
  \key g \major
  \time 4/4
  \omit Score.BarNumber
  d4^\markup { \italic "con espressione" } e4 fis4 g4 |
  a2 b4( a4) |
  g4 fis4 e4~ e8 dis8 |
  d2. r4 |
}
upper = \relative c' {
  \clef treble
  \key g \major
  \time 4/4
  \omit Score.BarNumber
  % Sparse chordal support — wide spacing, Mahler's lean texture
  <d fis>4\pp r4 <d g>4 r4 |
  <e a>2 <d g>4 r4 |
  <b g'>4 r4 <b fis'>4 r4 |
  <d fis a>2. r4 |
}
lower = \relative c, {
  \clef bass
  \key g \major
  \time 4/4
  \omit Score.BarNumber
  % Long bass notes — sparse pedal tones
  g1\pp |
  e1 |
  b'2~ b4 r4 |
  d2. r4 |
}
\score {
  <<
    \new Staff \vocal
    \new GrandStaff <<
      \new Staff \upper
      \new Staff \lower
    >>
  >>
  \layout { }
}
