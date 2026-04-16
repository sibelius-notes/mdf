\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% Type 3 (standard): Expo - Dev - Recap
    c''4^"Expo: P(I)" e''4 g''2^"→V" |
    g''4^"Dev." a''4 b''4 c'''4 |
    g''4^"retrans." f''4 e''4 d''4 |
    c''4^"Recap: P(I)" e''4 g''2^"ESC" \bar "|."
  }
  \layout { }
}
