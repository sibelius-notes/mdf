\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Bridge: contrasting material in relative minor — vi-V-IV-V
% New pitch area, wider leaps, harmonic contrast after repeated chorus

chordsBridge = \chordmode {
  a1:m | e1 | f1 | g1 |
}

melodyBridge = \relative c'' {
  \clef treble \key a \minor \time 4/4
  \omit Score.BarNumber
  a4 e8 f g4 a |
  gis4 b8 a~ a4 gis |
  f4 g a f |
  e4 d e2 \bar "|."
}

bassBridge = \relative c {
  \clef bass \key a \minor \time 4/4
  \omit Score.BarNumber
  a4 c e2 |
  e,4 gis b2 |
  f4 a c2 |
  g4 b d2 |
}

\score {
  <<
    \new ChordNames { \chordsBridge }
    \new GrandStaff <<
      \new Staff { \melodyBridge }
      \new Staff { \bassBridge }
    >>
  >>
  \layout { }
}
