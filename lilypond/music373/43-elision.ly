\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Phrase 1 approach to cadence
      e''4^"Phrase 1" f''4 g''4 a''4 |
      %% Elision: cadence point = new phrase beginning
      c''4^"PAC = new start" e''4 g''4 e''4 |
      c''2^"Phrase 2 continues" r2 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,4 d,4 e,4 f,4 |
      c,4 e,4 g,4 e,4 |
      c,2 r2 \bar "|."
    }
  >>
  \layout { }
}
