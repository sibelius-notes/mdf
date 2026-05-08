\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Ravel mechanical precision: clock ostinato + flowing waltz accompaniment
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      \tempo "Tempo di valse"
      % "Clock" ostinato: staccato repeated Cs
      c''8-.\mf c''8-. c''8-. c''8-. c''8-. c''8-. |
      c''8-. c''8-. c''8-. c''8-. c''8-. c''8-. |
      c''8-. c''8-. c''8-. e''8-. g''8-. e''8-. |
      c''4-. r4 r4 |
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      % Flowing waltz accompaniment
      c,4\mp <e g>4 <e g>4 |
      g,,4 <d g>4 <d g>4 |
      a,,4 <e a>4 <c' e'>4 |
      g,4 <b, d>4 r4 |
    }
  >>
  \layout { }
}
