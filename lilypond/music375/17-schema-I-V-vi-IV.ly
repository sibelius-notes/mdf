\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordsA = \chordmode {
  c1 | g1 | a1:m | f1 |
}

melodyA = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  e4 d8 c b4 c8 d |
  d4 c8 b a4 b |
  c4 a8 g a4 b8 c |
  e4 d e2 \bar "|."
}

bassA = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g2 |
  g,4 b d2 |
  a4 c e2 |
  f4 a c2 |
}

\score {
  <<
    \new ChordNames { \chordsA }
    \new GrandStaff <<
      \new Staff { \melodyA }
      \new Staff { \bassA }
    >>
  >>
  \layout { }
}
