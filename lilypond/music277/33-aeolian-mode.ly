\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key a \minor \time 4/4
    \omit Score.BarNumber
    % A Aeolian (natural minor): A B C D E F G
    a'4 b'4 c''4 d''4 | e''4 f''4 g''4 a''4 |
    a''4 g''4 f''4 e''4 | d''4 c''4 b'4 a'2 r4 |
  }
  \layout { }
}
