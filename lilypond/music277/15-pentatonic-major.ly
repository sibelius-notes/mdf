\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % C major pentatonic: C D E G A
    c'4 d'4 e'4 g'4 | a'4 g'4 e'4 d'4 | c'1 |
  }
  \layout { }
}
