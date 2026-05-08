\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Harmonic series of a vibrating string: partials 1-8 on C2
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Partials 2-8: c3 g3 c4 e4 g4 bes4 c5
      c'8^\markup { \small "2f" }
      g'8^\markup { \small "3f" }
      c''8^\markup { \small "4f" }
      e''8^\markup { \small "5f" }
      g''8^\markup { \small "6f" }
      bes''8^\markup { \small "7f" }
      c'''4^\markup { \small "8f" }
      |
      r1
      |
      r1
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Partial 1: fundamental C2
      c,1^\markup { \small "1f" }
      |
      r1
      |
      r1
    }
  >>
  \layout { }
}
