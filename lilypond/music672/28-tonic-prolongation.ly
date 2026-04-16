\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 6.1 — Tonic prolongation: neighbor-note V within tonic region
% I → V(neighbor) → I before the structural V is reached
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      e''1^"3̂ prolonged" e''1 e''1
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,1_"I" (g,,1_"V (nb)" c,1)_"I"
    }
  >>
  \layout { }
}
