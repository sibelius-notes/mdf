\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Dominant pedal building expectation
      b'2^"V7" d''2 | b'2 f''2 | b'1^"V sustained" |
      %% Recapitulation arrives
      c''4^"Recap: I" e''4 g''2 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      g,1 | g,1 | g,1 |
      c,2 e,2 \bar "|."
    }
  >>
  \layout { }
}
