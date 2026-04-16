\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% TR drive toward MC (HC in V)
      e''4^"TR" f''4 g''4 a''4 |
      b''2^"V:HC" r2^"MC gap" |
      %% S-zone begins
      d''4^"S (V)" e''4 f''4 e''4 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,4 d,4 e,4 f,4 |
      g,2 r2 |
      g,4 g,4 g,4 g,4 \bar "|."
    }
  >>
  \layout { }
}
