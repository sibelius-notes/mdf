\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Verse phrase (4 bars, lower register)
    \mark "Verse"
    c'2 d'2 e'2 d'2 | c'1 | c'2 e'2 d'2 c'2 | d'1 |
    % Chorus phrase (4 bars, higher register)
    \mark "Chorus"
    g'2 a'2 g'2 e'2 | f'1 | g'2 f'2 e'2 d'2 | c'1 |
  }
  \layout { }
}
