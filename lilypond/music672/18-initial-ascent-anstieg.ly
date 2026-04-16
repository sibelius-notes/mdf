\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 4.5 — Initial Ascent (Anstieg) approaching the primary tone 5̂
% Filled noteheads for Anstieg, open notehead for Kopfton
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Anstieg: c'' → d'' → e'' → (skip) → g'' (primary tone)
    c''4_"1̂ start" d''4_"2̂" e''4_"3̂"
    % Arrival on primary tone 5̂
    g''2.^"5̂ Kopfton" r4
    % Urlinie descent begins
    g''1^"5̂"
    f''2^"4̂" e''2^"3̂"
    d''2^"2̂" c''2^"1̂"
  }
  \layout { }
}
