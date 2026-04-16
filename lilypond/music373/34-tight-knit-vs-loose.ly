\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Tight-knit: regular 4-bar, simple I-V
      c''2^"tight: I" g''2 | c''2 g''2 |
      \bar "||"
      %% Loose: irregular, chromatic, evaded
      c''4^"loose" cis''4 d''4 ees''4 |
      e''8^"evaded" dis''8 e''8 f''8 g''4 r4 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,2 g,2 | c,2 g,2 |
      c,4 a,4 f,4 g,4 |
      c,4 g,4 g,4 r4 \bar "|."
    }
  >>
  \layout { }
}
