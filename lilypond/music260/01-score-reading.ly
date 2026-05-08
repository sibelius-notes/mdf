\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Orchestral score reading guide: how instruments are ordered top-to-bottom
\score {
  <<
    \new StaffGroup <<
      \new Staff \with { instrumentName = "Violin I" } {
        \clef treble \key c \major \time 4/4 \omit Score.BarNumber
        c'2 c'2 | c'2 c'2 | c'2 c'2 | c'2 c'2 |
      }
      \new Staff \with { instrumentName = "Viola" } {
        \clef alto \key c \major \time 4/4 \omit Score.BarNumber
        g2 g2 | g2 g2 | g2 g2 | g2 g2 |
      }
      \new Staff \with { instrumentName = "Cello" } {
        \clef bass \key c \major \time 4/4 \omit Score.BarNumber
        c,4 d,4 e,4 f,4 | g,4 a,4 b,4 c4 | b,4 a,4 g,4 f,4 | e,4 d,4 c,2 |
      }
    >>
  >>
  \header {
    piece = \markup \italic "Score order: top = highest, bottom = lowest instrument family"
  }
  \layout { }
}
