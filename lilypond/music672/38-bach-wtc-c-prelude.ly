\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 7.1 — Bach WTC Prelude in C: Urlinie sketch (3̂–2̂–1̂ over I–V–I)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Urlinie: 3̂ (E) held over tonic, then 2̂ (D) over dom., 1̂ (C) at close
      e''1^"3̂"
      e''1^"3̂ prolonged"
      d''1^"2̂"
      c''1^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,1_"I"
      c,1_"I"
      g,,1_"V"
      c,1_"I"
    }
  >>
  \layout { }
}
