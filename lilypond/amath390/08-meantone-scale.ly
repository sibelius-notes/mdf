\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Quarter-comma meantone scale: fifth = 5^(1/4) ~ 696.6c
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      c'1_\markup { \small "0c" }      |
      d'1_\markup { \small "193c" }    |
      e'1_\markup { \small "386c" }    |
      f'1_\markup { \small "503c" }    |
      g'1_\markup { \small "697c" }    |
      a'1_\markup { \small "890c" }    |
      b'1_\markup { \small "1083c" }   |
      c''1_\markup { \small "1200c" }  |
      % Bar 9: wolf fifth G#-Eb
      gis'2^\markup { \small "Wolf fifth ~737c" } ees''2 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c1 | c1 | c1 | c1 | c1 | c1 | c1 | c1 |
      r1 |
    }
  >>
  \header {
    piece = \markup { \small "Quarter-comma meantone: fifth = 696.6c; E = 386c (pure third)" }
  }
  \layout { }
}
