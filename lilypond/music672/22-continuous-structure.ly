\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 5.3 — Continuous structure: single uninterrupted Ursatz descent
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      % Continuous descent from 3̂ to 1̂ without interruption
      e''2.^"3̂" d''2.^"2̂" c''2.^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      c,2._"I" g,,2._"V" c,2._"I"
    }
  >>
  \layout { }
}
