\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Wolf fifth demonstration in meantone temperament
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1: G# to Eb — the wolf fifth (~737c)
      << gis'1 ees''1 >>^\markup { \small "Wolf fifth ~737c" }
      |
      % Bar 2: G to D — pure meantone fifth (~697c)
      << g'1 d''1 >>^\markup { \small "Meantone fifth ~697c" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      gis,1_\markup { \small "G#" }
      |
      g,1_\markup { \small "G" }
    }
  >>
  \header {
    piece = \markup { \small "Eb ≠ D# in meantone: the wolf fifth howls between G# and Eb" }
  }
  \layout { }
}
