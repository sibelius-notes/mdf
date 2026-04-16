\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 2.4 — Two-voice counterpoint at the background
% Soprano: 5̂ over I, 2̂ over V, 1̂ over I (first-species intervals shown)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      g''2.^"5̂"
      d''2.^"2̂"
      c''2.^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      c,2._"I"
      g,,2._"V"
      c,2._"I"
    }
  >>
  \layout { }
}
