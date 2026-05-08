\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Melodic sequence: 2-bar figure repeated down a diatonic step
% Bars 1-2: figure on G; bars 3-4: same figure transposed down to E

chordsSeq = \chordmode {
  c1 | g1 | a1:m | f1 |
}

melodySeq = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Figure at pitch level 1 (starting on G)
  \mark \markup { \italic "seq. 1" }
  g4 f e8 f g4 |
  f4 e d2 |
  % Same figure transposed down a step (starting on E)
  \mark \markup { \italic "seq. 2" }
  e4 d c8 d e4 |
  d4 c b2 \bar "|."
}

bassSeq = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g2 |
  g,4 b d2 |
  a4 c e2 |
  f4 a c2 |
}

\score {
  <<
    \new ChordNames { \chordsSeq }
    \new GrandStaff <<
      \new Staff { \melodySeq }
      \new Staff { \bassSeq }
    >>
  >>
  \layout { }
}
