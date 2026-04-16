\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Antecedent
      c''4^"ant." e''4 d''4 c''4 |
      d''4 f''4 e''2^"HC" |
      %% Consequent
      c''4^"cons." e''4 d''4 c''4 |
      d''4 b'4 c''2^"PAC" \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,2 e,2 |
      f,2 g,2 |
      c,2 e,2 |
      f,4 g,4 c,2 \bar "|."
    }
  >>
  \layout { }
}
