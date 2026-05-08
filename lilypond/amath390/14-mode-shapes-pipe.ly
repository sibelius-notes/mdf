\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Vibration modes of open vs. closed pipes as pitch content
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup { \small "Open" } } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Open pipe: harmonics 1,2,3,4,5 = C3, C4, G4, C5, E5
      c'1^\markup { \small "mode 1" } |
      c''1^\markup { \small "mode 2" } |
      g''1^\markup { \small "mode 3" } |
      c'''1^\markup { \small "mode 4" } |
      e'''1^\markup { \small "mode 5" } |
    }
    \new Staff \with { instrumentName = \markup { \small "Closed" } } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Closed pipe: harmonics 1,3,5,7 = C3, G4, E5, Bb5 (odd only)
      c'1^\markup { \small "mode 1" } |
      g''1^\markup { \small "mode 3" } |
      e'''1^\markup { \small "mode 5" } |
      bes'''1^\markup { \small "mode 7" } |
      r1 |
    }
  >>
  \header {
    piece = \markup { \small "Open pipes: all harmonics; Closed pipes: odd harmonics only" }
  }
  \layout { }
}
