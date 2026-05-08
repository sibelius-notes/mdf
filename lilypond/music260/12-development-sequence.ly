\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Romantic development-section descending sequence with modulation markup
% 4-bar descending-fifths sequence: G major → E minor → C major → A minor
myChords = \chordmode {
  \omit Score.BarNumber
  g2 g2 | e2:m e2:m | c2 c2 | a2:m a2:m |
}
upper = \relative c'' {
  \clef treble
  \key g \major
  \time 4/4
  \omit Score.BarNumber
  % Melodic sequence descending stepwise each bar
  d4_\markup { \tiny "G major" } b4 g4 d4 |
  b'4_\markup { \tiny "E minor" } g4 e4 b4 |
  g'4_\markup { \tiny "C major" } e4 c4 g4 |
  e'4_\markup { \tiny "A minor" } c4 a4 e4 |
}
lower = \relative c {
  \clef bass
  \key g \major
  \time 4/4
  \omit Score.BarNumber
  g4 d' g d |
  e,4 b' e b |
  c4 g' e c |
  a4 e' a e |
}
\score {
  <<
    \new ChordNames \myChords
    \new GrandStaff <<
      \new Staff \upper
      \new Staff \lower
    >>
  >>
  \layout { }
}
