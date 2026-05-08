\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordNames = \chordmode {
  a1:7 a1:7 d1:7 a1:7
}

melody = \relative c'' {
  \clef treble \key a \minor \time 4/4
  \omit Score.BarNumber
  % A blues scale lick: A C D Eb E G — b5 (Eb) is the blue note
  a8 c d ees^\markup { \tiny "b5" } e g e d |
  c8 a c d ees e g a |
  d8 f a f d c a ees |
  e8 g a g e d c a |
}

bass = \relative c {
  \clef bass \key a \minor \time 4/4
  \omit Score.BarNumber
  <a c e g>2 <a c e g>2 |
  <a c e g>2 <a c e g>2 |
  <d f a c>2 <d f a c>2 |
  <a c e g>2 <a c e g>2 |
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
