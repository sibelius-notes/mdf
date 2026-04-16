\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% Orchestral exposition: P and S both in tonic
    c''4^"Orch. P (I)" e''4 g''2 |
    c''4^"Orch. S (I-stay)" e''4 g''2^"no modulation" |
    \bar "||"
    %% Solo exposition: standard modulation
    c''4^"Solo P (I)" e''4 g''2 |
    g''4^"Solo S (V)" b''4 d'''2^"EEC: V:PAC" \bar "|."
  }
  \layout { }
}
