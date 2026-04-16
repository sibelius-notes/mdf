\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Example 4.1 — Neighbor-note prolongation at the middleground
% E (3̂ over I) → F (upper neighbor, ii6) → E (return to I)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      % Structural E: neighbor F: return E
      e''2.^"3̂" (f''2.^"UN" e''2.)^"3̂"
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      c,2._"I" d,2._"ii⁶" c,2._"I"
    }
  >>
  \layout { }
}
