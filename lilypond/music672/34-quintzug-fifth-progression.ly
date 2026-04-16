\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 4.2 — Quintzug (fifth-progression) as elaboration of a harmonic span
% Ascending Quintzug in the bass: C→D→E→F→G (I to V)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 5/4 \omit Score.BarNumber
      e''1^"3̂" e''1 e''1 e''1 d''1^"2̂"
    }
    \new Staff {
      \clef bass \key c \major \time 5/4 \omit Score.BarNumber
      c,1_"I" d,1_"PT" e,1_"PT" f,1_"PT" g,,1_"V"
    }
  >>
  \layout { }
}
