\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% R: Refrain in tonic
    c''4^"R (I)" e''4 g''4 e''4 | c''2^"PAC" r2 |
    %% A: Episode in dominant
    g''4^"A (V)" b''4 d'''4 b''4 | g''2^"PAC" r2 |
    %% R: Refrain return
    c''4^"R (I)" e''4 g''4 e''4 | c''2^"PAC" r2 |
    %% B: Episode in relative minor
    a'4^"B (vi)" c''4 e''4 c''4 | a'2^"PAC" r2 |
    %% R: Final refrain
    c''4^"R (I)" e''4 g''4 e''4 | c''2.^"PAC" r4 \bar "|."
  }
  \layout { }
}
