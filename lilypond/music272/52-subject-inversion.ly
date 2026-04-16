\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 4/4
      \omit Score.BarNumber
      d'4^\markup { \small "subject" } e' f' g' | a'4 g' fis' g'
      \bar "||"
    }
    \new Staff {
      \clef treble \key d \minor \time 4/4
      d'4_\markup { \small "inversion (each interval reversed)" } c' bes a | g4 a bes a
      \bar "|."
    }
  >>
  \layout { }
}
