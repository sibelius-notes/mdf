\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 4/4
      \omit Score.BarNumber
      d'4^\markup { \small "subject" } e' f' g' | a'4 g' fis' g'
      \bar "|."
    }
    \new Staff {
      \clef bass \key d \minor \time 4/4
      a,2._\markup { \small "countersubject" } g,4 | f,4 e, d, e,
      \bar "|."
    }
  >>
  \layout { }
}
