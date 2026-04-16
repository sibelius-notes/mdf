\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Chapter 7 — Bach chorale phrase middleground: reduced to structural notes only
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Middleground: structural soprano only
      e''2^"3̂" e''2^"3̂"
      d''1^"2̂"
      c''1^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,1_"I" g,,1_"V" c,1_"I"
    }
  >>
  \layout { }
}
