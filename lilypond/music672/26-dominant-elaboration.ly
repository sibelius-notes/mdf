\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 6.2 — Elaboration of dominant: V with 5-6 motion in soprano
% Bass sustains V while soprano moves 5̂→6̂ above it
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % 5-6 motion above V: D→E (2̂→3̂ above G bass)
      d''2^"5th" e''2^"6th"
      d''2^"5th ret." c''2^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      g,,2_"V" g,,2_"V" g,,2_"V" c,2_"I"
    }
  >>
  \layout { }
}
