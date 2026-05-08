\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Anti-hook: stepwise monotone, no surprise, deliberately forgettable
% Compare with 01-melodic-hook.ly — no contour, no gap, no rhythm identity

chordsAnti = \chordmode {
  c1 | c1 | c1 | c1 |
}

melodyAnti = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  c4 d e f |
  g4 f e d |
  c4 d e f |
  g2 c,2 \bar "|."
}

bassAnti = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c1 |
  c1 |
  c1 |
  c1 |
}

\score {
  <<
    \new ChordNames { \chordsAnti }
    \new GrandStaff <<
      \new Staff { \melodyAnti }
      \new Staff { \bassAnti }
    >>
  >>
  \layout { }
}
