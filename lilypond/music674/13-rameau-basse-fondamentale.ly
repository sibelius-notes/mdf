\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Rameau basse fondamentale: I-IV-V-I progression with figured bass and Roman numerals
\score {
  <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <e' g'>2 <e' g'>2
      <f' a'>2 <f' a'>2
      <g' b'>2 <g' b'>2
      <e' g'>2 <e' g'>2
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2_\markup { \small "I" }
      c2
      f2_\markup { \small "IV" }
      f2
      g2_\markup { \small "V" }
      g2
      c2_\markup { \small "I" }
      c2
    }
  >>
  \layout { }
}
