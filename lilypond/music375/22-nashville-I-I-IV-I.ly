\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordsNash = \chordmode {
  g1 | g1 | c1 | g1 |
}

% Pedal-steel-inflected melody: sustained tones with slow ornament
melodyNash = \relative c'' {
  \clef treble \key g \major \time 4/4
  \omit Score.BarNumber
  d2~ d8 e d4 |
  b2~ b8 c b4 |
  c2~ c8 d c4 |
  b4 a g2 \bar "|."
}

% G pedal bass with occasional passing tones
bassNash = \relative c {
  \clef bass \key g \major \time 4/4
  \omit Score.BarNumber
  g4 g g g |
  g4 g a g |
  c4 c g g |
  g4 fis g2 |
}

\score {
  <<
    \new ChordNames { \chordsNash }
    \new GrandStaff <<
      \new Staff { \melodyNash }
      \new Staff { \bassNash }
    >>
  >>
  \layout { }
}
