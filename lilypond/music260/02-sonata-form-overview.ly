\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Sonata form schematic: P-theme, TR, MC, S-theme, C sections
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Bars 1-2: P-theme in C major (I)
    c'4^\markup { \bold "P (I)" } e'4 g'4 c''4 |
    e''4 d''4 c''2 |
    % Bar 3: Transition (sequential, V pedal)
    g'4^\markup { \bold "TR" } a'4 b'4 g'4 |
    % Bar 4: MC pause
    r2^\markup { \bold "MC ‖" } r4 r4 \bar "||"
    % Bars 5-6: S-theme in G major (V)
    d''4^\markup { \bold "S (V)" } c''4 b'4 a'4 |
    g'2 \( a'4 b'4 \) |
    % Bar 7: Closing theme (C-zone, PAC)
    d''4^\markup { \bold "C" } b'4 g'4 d'4 |
    % Bar 8: repeat/development begins
    g'1 \bar "||"
  }
  \layout { }
}
