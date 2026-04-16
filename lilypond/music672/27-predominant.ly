\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 6.2 — Pre-dominant harmony: ii leading to structural V
% Bass: I → ii → V → I with stepwise 4̂–5̂ bass motion
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      e''1^"3̂" f''1^"4̂" d''1^"2̂" c''1^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,1_"I" d,1_"ii" g,,1_"V" c,1_"I"
    }
  >>
  \layout { }
}
