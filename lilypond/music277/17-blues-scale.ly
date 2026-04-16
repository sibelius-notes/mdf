\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key a \minor \time 4/4
    \omit Score.BarNumber
    % A blues scale: A C D Eb E G (pentatonic minor + b5)
    a'4 c''4 d''4 ees''4 | e''4 g''4 e''4 ees''4 | d''4 c''4 a'2 |
  }
  \layout { }
}
