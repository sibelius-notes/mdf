\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \minor \time 4/4
    \omit Score.BarNumber
    %% P-zone: C minor
    c''4^"P (c min.)" ees''4 g''2 |
    %% TR: drive toward relative major
    ees''4^"TR" f''4 g''4 aes''4 |
    %% MC (V of Eb major)
    bes'2^"V:HC MC (Eb)" r2 |
    %% S-zone in Eb major (relative major)
    ees''4^"S (III: Eb)" g''4 bes''4 g''4 |
    f''4 ees''4 ees''2^"EEC: III:PAC" \bar "|."
  }
  \layout { }
}
