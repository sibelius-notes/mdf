\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Antecedent (HC)
      c''4^"ant." e''4 d''2 |
      e''4 d''4 e''2^"HC" |
      %% Continuation (not parallel consequent)
      g''8^"cont." f''8 e''8 d''8 c''8 b'8 a'8 g'8 |
      c''4.^"cad." g'8 b'4 c''4^"PAC" \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,2 f,2 |
      e,2 g,2 |
      c,4 d,4 e,4 f,4 |
      c,2. c,4 \bar "|."
    }
  >>
  \layout { }
}
