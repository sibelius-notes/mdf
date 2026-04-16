\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Regular 4-bar phrase, then extended phrase with added bar
    \mark "Regular (4 bars)"
    c'4 e'4 g'4 e'4 |
    d'4 f'4 a'4 f'4 |
    g'4 f'4 e'4 d'4 |
    c'1 |
    \mark "Extended (5 bars)"
    c'4 e'4 g'4 e'4 |
    d'4 f'4 a'4 f'4 |
    g'4 f'4 e'4 d'4 |
    c'2 d'2 |
    c'1 |
  }
  \layout { }
}
