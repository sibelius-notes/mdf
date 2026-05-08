\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Chorus: widest range, arch contour — peak on beat 1 of bar 1 (high C)
% I-V-vi-IV

chordsChorus = \chordmode {
  c1 | g1 | a1:m | f1 |
}

melodyChorus = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  c4 b a g |
  b4 a g f |
  a4 g f e |
  d4 e f2 \bar "|."
}

bassChorus = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g2 |
  g,4 b d2 |
  a4 c e2 |
  f4 a c2 |
}

\score {
  <<
    \new ChordNames { \chordsChorus }
    \new GrandStaff <<
      \new Staff { \melodyChorus }
      \new Staff { \bassChorus }
    >>
  >>
  \layout { }
}
