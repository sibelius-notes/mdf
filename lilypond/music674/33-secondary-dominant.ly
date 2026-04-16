\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Weber secondary dominant notation: V/V–V–I in C major
\score {
  <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <fis' a' c''>1^\markup { \small "V/V (D7)" }
      <g' b' d''>1^\markup { \small "V" }
      <c' e' g'>1^\markup { \small "I" }
    }
  >>
  \layout { }
}
