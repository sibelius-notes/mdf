\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Pre-chorus: ascending motion, denser rhythm, building tension vi-IV-I-V

chordsPC = \chordmode {
  a1:m | f1 | c1 | g1 |
}

% Ascending 8th-note energy, each bar climbs higher
melodyPC = \relative c' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  a'8 a b b c4 c |
  c8 c d d e4 e |
  e8 e f f g4 g |
  g8 f e d c4 d \bar "|."
}

bassPC = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  a4 c e2 |
  f4 a c2 |
  c,4 e g2 |
  g,4 b d2 |
}

\score {
  <<
    \new ChordNames { \chordsPC }
    \new GrandStaff <<
      \new Staff { \melodyPC }
      \new Staff { \bassPC }
    >>
  >>
  \layout { }
}
