\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Pentatonic hook lead sheet: C pentatonic major (C D E G A — no F or B)
% Full 4-bar lead sheet over I-V-vi-IV

chordsPent = \chordmode {
  c1 | g1 | a1:m | f1 |
}

% Hook uses only C D E G A
melodyPent = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g4 e8 g~ g4 a |
  d4 a8 g~ g4 e8 d |
  e4 g8 a~ a4 g |
  e4 d c2 \bar "|."
}

bassPent = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g2 |
  g,4 b d2 |
  a4 c e2 |
  f4 a c2 |
}

\score {
  <<
    \new ChordNames { \chordsPent }
    \new GrandStaff <<
      \new Staff { \melodyPent }
      \new Staff { \bassPent }
    >>
  >>
  \layout { }
}
