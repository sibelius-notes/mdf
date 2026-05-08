\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Syntonic comma (81:80 = 21.5c): Pythagorean E vs. just E
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1: Pythagorean E (81:64, 408c)
      e'1^\markup { \small "81:64  +408c" }
      |
      % Bar 2: just E (5:4, 386c)
      e'1^\markup { \small "5:4  +386c" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c1_\markup { \small "C" }
      |
      c1_\markup { \small "C" }
    }
  >>
  \header {
    piece = \markup { \small "Syntonic comma = 408c - 386c = 21.5c" }
  }
  \layout { }
}
