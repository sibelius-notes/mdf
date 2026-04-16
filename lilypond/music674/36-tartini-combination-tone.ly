\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Tartini combination tone (terzo suono): perfect fifth 3:2 → difference tone = octave below lower pitch
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    c1^\markup { \small "diff. tone (100 Hz)" }
    <c' g'>1^\markup { \small "P5: 200+300 Hz" }
  }
  \layout { }
}
