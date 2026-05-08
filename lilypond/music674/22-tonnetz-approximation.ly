\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Neo-Riemannian Tonnetz: three connected triads via PLR operations
% C major → L → E minor (share E-G) → R → G major (share G-B)
% Smooth soprano voice leading throughout
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % C major: C E G
      <c' e' g'>2^\markup { \small "C major" }
      % L operation: E minor shares E-G with C major
      <e' g' b'>2^\markup { \small "L → E minor" }
      % R operation: G major shares G-B with E minor
      <g' b' d''>2^\markup { \small "R → G major" }
      <g' b' d''>2
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2_\markup { \small "C Tonnetz" }
      e,2_\markup { \small "E" }
      g,2_\markup { \small "G" }
      g,2
    }
  >>
  \layout { }
}
