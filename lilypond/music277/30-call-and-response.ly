\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Call (vocalist): ascending
      \mark "Call"
      c'4 e'4 g'4 a'4 |
      % Response (instrument): descending
      \mark "Response"
      g'4 f'4 e'4 d'4 |
      % Second call
      \mark "Call"
      c'4 e'4 g'4 c''4 |
      % Second response — conclusive
      \mark "Response"
      b'4 a'4 g'2 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      <c e g>1 | <g, b, d>1 | <c e g>1 | <g, b, d>1 |
    }
  >>
  \layout { }
}
