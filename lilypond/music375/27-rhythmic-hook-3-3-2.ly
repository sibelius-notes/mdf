\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% 3+3+2 hemiola pattern: melody rhythm groups as 3+3+2 eighth notes within 4/4
% The pattern creates cross-rhythmic tension against the regular pulse

chordsThreeThreeTwo = \chordmode {
  c1 | g1 | a1:m | f1 |
}

% 3+3+2 pattern: on-on-on | on-on-on | on-on (=8 eighth notes = one 4/4 bar)
melodyThreeThreeTwo = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Bar 1: 3+3+2 on C (groups: g8 g g | g g g | g g)
  g8 g g~ g g g~ g g |
  g8 g g~ g g g~ g g |
  % Bars 3-4: same pattern, melodic variation
  a8 a a~ a a a~ a g |
  f8 f f~ f e f~ f4 \bar "|."
}

bassThreeThreeTwo = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 r r8 c4 r8 |
  g4 r r8 g4 r8 |
  a4 r r8 a4 r8 |
  f4 r r8 f4 r8 |
}

\score {
  <<
    \new ChordNames { \chordsThreeThreeTwo }
    \new GrandStaff <<
      \new Staff { \melodyThreeThreeTwo }
      \new Staff { \bassThreeThreeTwo }
    >>
  >>
  \layout { }
}
