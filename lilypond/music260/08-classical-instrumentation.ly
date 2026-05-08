\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Classical orchestra balance: 4-staff StaffGroup
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = "Strings" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Violin range: C-E-G-C arpeggio
      c'4\mf e'4 g'4 c''4 |
      c''4 g'4 e'4 c'4 |
      c'4 e'4 g'4 c''4 |
      c''2 c'2 |
    }
    \new Staff \with { instrumentName = "Woodwinds" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Sustained harmony
      c''1\mp |
      e''1 |
      c''1 |
      e''1 |
    }
    \new Staff \with { instrumentName = "Brass" } {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Long reinforcement notes
      c1\mp |
      g1 |
      c1 |
      c1 |
    }
    \new Staff \with { instrumentName = "Timpani" } {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Beat 1 only
      c,2.\mp r4 |
      c,2. r4 |
      c,2. r4 |
      c,2. r4 |
    }
  >>
  \layout { }
}
