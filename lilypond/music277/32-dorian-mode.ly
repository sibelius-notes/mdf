\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % D Dorian scale: D E F G A B C D (natural minor with raised 6th)
    d'4 e'4 f'4 g'4 | a'4 b'4 c''4 d''4 |
    d''4 c''4 b'4 a'4 | g'4 f'4 e'4 d'2 r4 |
  }
  \layout { }
}
