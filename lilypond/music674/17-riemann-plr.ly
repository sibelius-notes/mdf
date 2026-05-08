\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Riemann PLR (neo-Riemannian) operations from C major:
% L = leading-tone exchange → E minor
% P = parallel → C minor
% R = relative → A minor
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c' e' g'>1^\markup { \small "C major" }
      <e' g' b'>1^\markup { \small "L → E minor" }
      <c' ees' g'>1^\markup { \small "P → C minor" }
      <a c' e'>1^\markup { \small "R → A minor" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2_\markup { \small "start" } c2 |
      e,2_\markup { \small "L" } e,2 |
      c2_\markup { \small "P" } c2 |
      a,2_\markup { \small "R" } a,2
    }
  >>
  \layout { }
}
