\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 4.3 — Prolongation by arpeggiation: tonic triad composed out in soprano
% Soprano arpeggiates c''→e''→g'' while bass holds I
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      c''4_"1̂" e''4_"3̂" g''4_"5̂"
      g''2. e''2. c''2.
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      c,2._"I" c,2. c,2.
      c,2. c,2. c,2.
    }
  >>
  \layout { }
}
