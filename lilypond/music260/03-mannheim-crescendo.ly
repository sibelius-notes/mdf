\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Mannheim crescendo: pp to ff over 4 bars
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    \tempo \markup { \bold "Mannheim Crescendo: " \dynamic pp " → " \dynamic ff }
    % Bar 1: pp whole note
    c'1\pp |
    % Bar 2: repeated 8th-note pattern mp
    c'8\mp c'8 c'8 c'8 c'8 c'8 c'8 c'8 |
    % Bar 3: repeated 8th-note pattern mf, higher
    e'8\mf e'8 e'8 e'8 e'8 e'8 e'8 e'8 |
    % Bar 4: full ff arrival on C5
    g'8\< g'8 g'8 g'8 c''4 c''4\ff |
  }
  \layout { }
}
