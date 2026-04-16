\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 6.4 — Motivic parallelism across structural levels
% Descending third appears at foreground, middleground, and as background Urlinie echo
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup \tiny "FG motive" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      e''4^"E" d''4^"D" c''2^"C"
      e''4 d''4 c''2
    }
    \new Staff \with { instrumentName = \markup \tiny "MG Terzug" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      e''2^"3̂" d''2^"2̂"
      c''1^"1̂"
    }
    \new Staff \with { instrumentName = \markup \tiny "BG Ursatz" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      e''1^"3̂" d''1^"2̂" c''1^"1̂"
    }
  >>
  \layout { indent = 1.8\cm }
}
