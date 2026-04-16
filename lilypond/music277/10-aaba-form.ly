\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % AABA: each letter = 2 bars for brevity
    \mark "A"
    c'2 e'2 g'2 e'2 | c'1 |
    \mark "A"
    c'2 e'2 g'2 e'2 | c'1 |
    \mark "B"
    a'2 g'2 f'2 e'2 | d'1 |
    \mark "A"
    c'2 e'2 g'2 e'2 | c'1 |
  }
  \layout { }
}
