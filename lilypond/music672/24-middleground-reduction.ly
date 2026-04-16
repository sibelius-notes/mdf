\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 3.6 — Middleground reduction: structural notes only
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Middleground: passing tones eliminated, structural notes remain
      e''2^"3̂" e''2
      d''2^"2̂" d''2
      c''1^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,2_"I" c,2 g,,2_"V" g,,2 c,1_"I"
    }
  >>
  \layout { }
}
