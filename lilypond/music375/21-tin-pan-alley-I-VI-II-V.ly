\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordsTPA = \chordmode {
  c1 | a1:m | d1:m7 | g1:7 |
}

% Crooner-style phrase with chromatic approach on beat 4 of bar 3
melodyTPA = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  e4 e8 d~ d4 c8 d |
  e4 c8 b~ b4 a |
  a4 c8 d~ d4 cis8 d |
  b4 a g2 \bar "|."
}

bassTPA = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c2 c4 b |
  a2 a4 gis |
  d'2 d4 cis |
  g2 g4 f |
}

\score {
  <<
    \new ChordNames { \chordsTPA }
    \new GrandStaff <<
      \new Staff { \melodyTPA }
      \new Staff { \bassTPA }
    >>
  >>
  \layout { }
}
