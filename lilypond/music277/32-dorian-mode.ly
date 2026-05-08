\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordNames = \chordmode {
  d1:m7 g1 d1:m7 g1
}

melody = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % D Dorian lick — B natural is the characteristic raised 6th
  d8 e f g a b^\markup { \tiny "B♮: Dorian ♮6" } c d |
  d8 c b a g f e d |
  a'8 g f e d e f g |
  a8 b c d c a g f |
}

bass = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  <d f a c>2 <d f a c>2 |
  <g b d f>2 <g b d f>2 |
  <d f a c>2 <d f a c>2 |
  <g b d f>2 <g b d f>2 |
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
