\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Example 4.3 — Unfolding (Ausfaltung): two voices in one staff
% Upper voice G4, lower voice E3 unfolded as a single melodic line
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Single melodic line weaving between two structural voices
    % Upper: g'' = 5̂, Lower: e' = 3̂ (a tenth apart)
    g''4^"upper voice" e'4_"lower voice"
    g''4^"upper" e'4_"lower"
    % Resolves back to unified voice
    g''2 e''2
  }
  \layout { }
}
