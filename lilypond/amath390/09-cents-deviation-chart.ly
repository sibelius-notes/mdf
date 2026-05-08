\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Deviation of Pythagorean and Just tunings from 12-TET
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Pythagorean deviations from 12-TET
      c'1^\markup { \small "0c" }    |
      d'1^\markup { \small "+4c" }   |
      e'1^\markup { \small "+8c" }   |
      f'1^\markup { \small "-2c" }   |
      g'1^\markup { \small "+2c" }   |
      a'1^\markup { \small "+6c" }   |
      b'1^\markup { \small "+10c" }  |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Just deviations from 12-TET
      c1_\markup { \small "0c" }     |
      d1_\markup { \small "+4c" }    |
      e1_\markup { \small "-14c" }   |
      f1_\markup { \small "-2c" }    |
      g1_\markup { \small "+2c" }    |
      a1_\markup { \small "-16c" }   |
      b1_\markup { \small "-12c" }   |
    }
  >>
  \header {
    piece = "Deviation from 12-TET  (treble = Pythagorean, bass = Just)"
  }
  \layout { }
}
