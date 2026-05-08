\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordNames = \chordmode {
  e1:5 a1:5 d1:5 e1:5
}

upper = \relative c'' {
  \clef treble \time 4/4
  \omit Score.BarNumber
  % E5 A5 D5 E5 power chord riff — ff quarter notes
  <e b>4\ff <e b>4 <e b>4 <e b>4 |
  <a e'>4\ff <a e'>4 <a e'>4 <a e'>4 |
  <d a>4\ff <d a>4 <d a>4 <d a>4 |
  <e b>4\ff <e b>4 <e b>4 r4 |
}

lower = \relative c {
  \clef bass \time 4/4
  \omit Score.BarNumber
  % Root notes in bass
  e4\ff e4 e4 e4 |
  a,4\ff a,4 a,4 a,4 |
  d4\ff d4 d4 d4 |
  e4\ff e4 e4 r4 |
}

\score {
  <<
    \new ChordNames \chordNames
    \new GrandStaff <<
      \new Staff \upper
      \new Staff \lower
    >>
  >>
  \layout { }
}
