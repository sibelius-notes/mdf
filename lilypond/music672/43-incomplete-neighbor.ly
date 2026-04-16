\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 4.1 — Incomplete neighbor note (approaches from neighbor, no prior structural tone)
% Melody begins on F (upper neighbor) and resolves down to E (structural 3̂)
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Incomplete upper neighbor: F→E (no prior E stated)
    f''2^"IN (upper nb)" e''2^"3̂"
    % Complete neighbor for comparison: E–F–E
    e''4^"3̂" (f''4^"UN" e''2)^"3̂ return"
  }
  \layout { }
}
