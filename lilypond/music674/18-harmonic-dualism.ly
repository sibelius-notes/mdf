\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Riemann's harmonic dualism: major triad built "upward" (overtone series)
% vs minor triad built "downward" (undertone/klanglich inversion)
% Treble = C major 4:5:6 ascending; Bass = A minor "5:6:... downward" reading
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Major triad: built upward, ratios 4:5:6
      <c' e' g'>2^\markup {
        \column { \small "Overtone series ↑" \small "4 : 5 : 6" }
      }
      <c' e' g'>2 |
      % Minor triad: A minor — read as G-E-C downward (Riemann's undertone inversion)
      <a c' e'>2^\markup {
        \column { \small "Undertone series ↓" \small "C-E-A (downward from E)" }
      }
      <a c' e'>2
    }
    \new Staff {
      \clef bass \key a \minor \time 4/4
      \omit Score.BarNumber
      c2_\markup { \small "C major: C root" } c2 |
      a,2_\markup { \small "A minor: dualistic root = E (top)" } a,2
    }
  >>
  \layout { }
}
