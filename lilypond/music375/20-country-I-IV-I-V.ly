\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordsCountry = \chordmode {
  g1 | c1 | g1 | d1 |
}

melodyCountry = \relative c'' {
  \clef treble \key g \major \time 4/4
  \omit Score.BarNumber
  % Country pentatonic phrase (G pentatonic: G A B D E)
  d4 b8 g~ g4 a8 b |
  c4 b8 a~ a4 g8 a |
  b4 d8 b g4 a8 b |
  a4 g d'2 \bar "|."
}

% Boots-and-shoes bass: root on 1, 5th on 3
bassCountry = \relative c {
  \clef bass \key g \major \time 4/4
  \omit Score.BarNumber
  g4 r8 g d'4 r8 d |
  c4 r8 c g'4 r8 g |
  g,4 r8 g d'4 r8 d |
  d,4 r8 d a'4 r8 a |
}

\score {
  <<
    \new ChordNames { \chordsCountry }
    \new GrandStaff <<
      \new Staff { \melodyCountry }
      \new Staff { \bassCountry }
    >>
  >>
  \layout { }
}
