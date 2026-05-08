\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Syncopated hook over I-V-vi-IV — rhythmic displacement creates tension

chordsSyn = \chordmode {
  c1 | g1 | a1:m | f1 |
}

melodySyn = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  r8 g8~ g4~ g8 c b4~ |
  b8 a g4~ g8 f e4 |
  r8 a8~ a4~ a8 c b4~ |
  b8 a~ a4 f2 \bar "|."
}

% Rhythmic comping: chord on beat 1, off-beat 8th push
bassSyn = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 r8 c8~ c4 r8 c |
  g4 r8 g8~ g4 r8 g |
  a4 r8 a8~ a4 r8 a |
  f4 r8 f8~ f4 r8 f |
}

\score {
  <<
    \new ChordNames { \chordsSyn }
    \new GrandStaff <<
      \new Staff { \melodySyn }
      \new Staff { \bassSyn }
    >>
  >>
  \layout { }
}
