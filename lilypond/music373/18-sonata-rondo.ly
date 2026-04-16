\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% R (P-zone, tonic) + A (S-zone, dominant) = Exposition
    c''4^"R: P (I)" e''4 g''2^"PAC" |
    g''4^"A: S (V)" b''4 d'''2^"EEC" |
    %% R (tonic)
    c''4^"R (I)" e''4 g''2 |
    %% B = Development
    ees''4^"B: Dev." fis''4 a''2^"unstable" |
    %% R + A (tonic) = Recapitulation
    c''4^"R: P (I)" e''4 g''2 |
    c''4^"A: S (I)" e''4 g''2^"ESC" |
    %% R: Coda
    c''4^"R: coda" e''4 g''2.^"PAC" r4 \bar "|."
  }
  \layout { }
}
