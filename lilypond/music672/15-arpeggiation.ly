\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 4.3 — Arpeggiation (Brechung): composing-out the tonic triad
% Soprano arpeggiates C–E–G (I) in melodic succession
\score {
  \new Staff {
    \clef treble \key c \major \time 3/4 \omit Score.BarNumber
    % Arpeggiation: C–E–G then G–E–C
    c''2._"root" e''2._"third" g''2._"fifth"
    g''2. e''2. c''2.
  }
  \layout { }
}
