\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% Development: remote key
    e'4^"Dev. (e min.)" g'4 b'4 d''4 |
    %% False recapitulation: P-theme in tonic but premature
    c''4^"false recap." e''4 g''2 |
    %% Departs again
    c''4^"departs" d''4 ees''4 f''4 |
    %% True retransition and recap
    g'2^"retrans. V" g'2 |
    c''4^"TRUE recap." e''4 g''2 \bar "|."
  }
  \layout { }
}
