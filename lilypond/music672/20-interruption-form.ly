\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Definition 5.1 — Interruption: 5̂–4̂–3̂–2̂ | 5̂–4̂–3̂–2̂–1̂
% Vertical stroke shows interruption point
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % First descent: 5̂→2̂ (interrupted)
      g''1^"5̂" f''1^"4̂" e''1^"3̂" d''1^"2̂ |"
      % Second descent: restart from 5̂, continue to 1̂
      g''1^"5̂" f''1^"4̂" e''1^"3̂" d''1^"2̂" c''1^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Bass: I...V | I...V–I
      c,1_"I" c,1 c,1 g,,1_"V"
      c,1_"I" c,1 c,1 g,,1_"V" c,1_"I"
    }
  >>
  \layout { }
}
