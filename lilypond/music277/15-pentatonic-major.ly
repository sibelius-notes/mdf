\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordNames = \chordmode {
  c1 g1 a1:m f1
}

melody = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % C pentatonic major lick: C D E G A
  c8 d e g a g e d |
  c8 e g a g e d c |
  e8 g a g e d c e |
  g2. r4 |
}

bass = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  % I – V – vi – IV comping
  <c e g>2 <c e g>2 |
  <g b d>2 <g b d>2 |
  <a c e>2 <a c e>2 |
  <f a c>2 <f a c>2 |
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
