\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Aristoxenus: three genera of the tetrachord (descending E→B)
% Diatonic: T T S  |  Chromatic: T S+S SS  |  Enharmonic: 2T QQ
% Each genus shown as a 2-bar phrase; Greek genus name labeled above
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Diatonic tetrachord: e' d' c' b  (T T S descending)
    e'2^\markup { \bold \small "Diatonic" } e'4 d'4 |
    c'2^\markup { \small "T  T  S" } b2 \bar "||"
    % Chromatic tetrachord: e' d' c' b  with c# to approximate chromatic
    % Approximated in standard notation: e' cis' c' b  (m3 + ST + ST)
    e'2^\markup { \bold \small "Chromatic" } e'4 cis'4 |
    c'4^\markup { \small "m3  S  S" } b2. \bar "||"
    % Enharmonic: large interval + two quarter-tones (approximated)
    % e' c' c' b  — approximate enharmonic with written annotation
    e'2^\markup { \bold \small "Enharmonic (approx.)" } e'4 c'4 |
    c'4^\markup { \small "M3  QT  QT" } b2. \bar "|."
  }
  \layout { }
}
