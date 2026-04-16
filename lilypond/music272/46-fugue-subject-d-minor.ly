\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key d \minor \time 4/4
    \omit Score.BarNumber
    d'4^\markup { \italic "subject — D minor" } e' f' g' | a'4 g' fis' g'
    \bar "|."
  }
  \layout { }
}
