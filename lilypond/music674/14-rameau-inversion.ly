\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Rameau chord inversion: root position, first inversion, second inversion of C major
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' e' g'>1^\markup { \small "root (5–3)" }
    <e' g' c''>1^\markup { \small "1st inv. (6–3)" }
    <g' c'' e''>1^\markup { \small "2nd inv. (6–4)" }
  }
  \layout { }
}
