\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 4.4 — Register transfer (Übergreifen): structural tone E moved to octave below
% Primary tone 3̂ (E5) transferred down to E4, then back up
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % E5 (high register) slurred down to E4 (low register) = register transfer
    e''2.^"3̂ (high)" (e'4^"transferred")
    % Melody continues in lower register
    d'2 c'2
    % Structural tone returns to high register
    (e''1)^"3̂ return"
  }
  \layout { }
}
