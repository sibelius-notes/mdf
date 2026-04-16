\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Three-section pop form
    \mark "Verse"
    c'2 d'2 e'2 c'2 | d'1 |
    \mark "Pre-Ch."
    e'2 f'2 g'2 a'2 | b'1 |
    \mark "Chorus"
    c''2 b'2 a'2 g'2 | c''1 |
  }
  \layout { }
}
