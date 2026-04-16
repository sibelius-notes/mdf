\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key d \minor \time 4/4
    \omit Score.BarNumber
    a'4^\markup { \italic "tonal answer — begins on 5th (A), opens 5th compressed to 4th" } bes' c'' d'' | e''4 d'' cis'' d''
    \bar "|."
  }
  \layout { }
}
