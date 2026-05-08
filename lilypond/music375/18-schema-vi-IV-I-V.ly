\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordsB = \chordmode {
  a1:m | f1 | c1 | g1 |
}

melodyB = \relative c'' {
  \clef treble \key a \minor \time 4/4
  \omit Score.BarNumber
  % vi-IV-I-V in A minor: melismatic pop melody emphasising scale degree 1
  a4 a8 g~ g4 a8 b |
  c4 b8 a~ a4 a8 g |
  g4 e8 f g4 f8 e |
  d4 e a2 \bar "|."
}

bassB = \relative c {
  \clef bass \key a \minor \time 4/4
  \omit Score.BarNumber
  a4 c e2 |
  f4 a c2 |
  c,4 e g2 |
  g,4 b d2 |
}

\score {
  <<
    \new ChordNames { \chordsB }
    \new GrandStaff <<
      \new Staff { \melodyB }
      \new Staff { \bassB }
    >>
  >>
  \layout { }
}
