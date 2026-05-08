\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Riemann Funktionslehre (1893): T-S-D-T in C major as a real 4-bar cadence
% GrandStaff with soprano voice leading; function labels T/S/D above
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/2
      \omit Score.BarNumber
      % Soprano line: e' f' g' e'
      <c' e' g'>2^\markup { \bold "T" } <c' e' g'>2 |
      <c' f' a'>2^\markup { \bold "S" } <c' f' a'>2 |
      <b d' g'>2^\markup { \bold "D" } <b d' g'>2 |
      <c' e' g'>1^\markup { \bold "T" }
    }
    \new Staff {
      \clef bass \key c \major \time 2/2
      \omit Score.BarNumber
      c2_\markup { \small "I" } c2 |
      f,2_\markup { \small "IV" } f,2 |
      g,2_\markup { \small "V" } g,2 |
      c2_\markup { \small "I" } c2
    }
  >>
  \layout { }
}
