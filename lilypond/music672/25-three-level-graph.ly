\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 3.6 — Three-level graph: foreground, middleground, background on separate staves
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup \tiny "FG" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      e''4 f''8 g''8 a''4 g''4
      f''4 e'' d''4. e''8
      d''2 c''2
    }
    \new Staff \with { instrumentName = \markup \tiny "MG" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      e''2^"3̂" e''2
      d''2^"2̂" d''2
      d''2 c''2^"1̂"
    }
    \new Staff \with { instrumentName = \markup \tiny "BG" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      e''1^"3̂" d''1^"2̂" c''1^"1̂"
    }
  >>
  \layout { indent = 1.2\cm }
}
