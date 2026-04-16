\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Ascending leap (sixth) followed by stepwise descent — generic pop hook
    c'4 a'4 g'4 f'4 | e'4 d'4 c'2 |
    c'4 a'4 g'4 f'4 | e'2 c'2 |
  }
  \layout { }
}
