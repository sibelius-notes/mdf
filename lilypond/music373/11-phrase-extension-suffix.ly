\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Normative 4-bar phrase ending PAC
      c''4^"phrase" e''4 g''4 e''4 |
      d''4 f''4 e''4 d''4 |
      c''4.^"cad." g'8 b'4 c''4^"PAC" |
      %% Suffix: post-cadential confirmation
      c''4^"suf." e''4 g''4 e''4 |
      c''2.^"suf. end" r4 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,2 e,2 |
      f,2 g,2 |
      c,2 g,2 |
      c,2 e,2 |
      c,2. r4 \bar "|."
    }
  >>
  \layout { }
}
