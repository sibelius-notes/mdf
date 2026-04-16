\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 2.3 — Cadential gesture: 2̂ over V → 1̂ over I
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/4 \omit Score.BarNumber
      d''2^"2̂" c''2^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 2/4 \omit Score.BarNumber
      g,,2_"V" c,2_"I"
    }
  >>
  \layout { }
}
