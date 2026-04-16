\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 2.3 — Bassbrechung: bass arpeggiation I–V–I in C major
\score {
  \new Staff {
    \clef bass \key c \major \time 3/4 \omit Score.BarNumber
    % Bass arpeggiation of tonic triad: C–G–C with slur
    c2.^"I"( g,2.^"V" c,2.)^"I"
  }
  \layout { }
}
