\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordNames = \chordmode {
  a1:m d1:m a1:m e1:m
}

melody = \relative c'' {
  \clef treble \key a \minor \time 4/4
  \omit Score.BarNumber
  % A minor pentatonic lick: A C D E G
  a8 c d e g e d c |
  a8 c d e g a g e |
  d8 e g a g e d c |
  a2. r4 |
}

bass = \relative c {
  \clef bass \key a \minor \time 4/4
  \omit Score.BarNumber
  <a c e>2 <a c e>2 |
  <d f a>2 <d f a>2 |
  <a c e>2 <a c e>2 |
  <e g b>2 <e g b>2 |
}

\score {
  <<
    \new ChordNames \chordNames
    \new GrandStaff <<
      \new Staff \melody
      \new Staff \bass
    >>
  >>
  \layout { }
}
