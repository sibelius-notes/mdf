\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Outro vamp: I7-IV7 repeating pattern with descending fade-style melody
% Melody descends and slows — implies fading out

chordsVamp = \chordmode {
  c1:7 | f1:7 | c1:7 | f1:7 |
}

% Descending melody — each bar slightly lower / more sparse
melodyVamp = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g4 f ees2 |
  f4 ees d2 |
  ees4 d c2 |
  d4 c bes2 \bar "|."
}

bassVamp = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g bes |
  f4 a c ees |
  c,4 e g bes |
  f4 a c ees |
}

\score {
  <<
    \new ChordNames { \chordsVamp }
    \new GrandStaff <<
      \new Staff { \melodyVamp }
      \new Staff { \bassVamp }
    >>
  >>
  \layout { }
}
