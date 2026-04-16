\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 4/4
      \omit Score.BarNumber
      d'4^\markup { \small "subject (original)" } e' f' g' | a'4 g' fis' g'
      \bar "|."
    }
    \new Staff {
      \clef bass \key d \minor \time 4/4
      d,2._\markup { \small "subject in augmentation (2×)" } e,4 | f,2 g,2 | a,2 g,2 | fis,2 g,2
      \bar "|."
    }
  >>
  \layout { }
}
