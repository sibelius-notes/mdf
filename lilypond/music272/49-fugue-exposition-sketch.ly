\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 4/4
      \omit Score.BarNumber
      r1 r1 |
      a'4^\markup { \small "answer (v.2)" } bes' c'' d'' | e''4 d'' cis'' d''
      \bar "|."
    }
    \new Staff {
      \clef bass \key d \minor \time 4/4
      d4^\markup { \small "subject (v.1)" } e f g | a4 g fis g |
      a,2. g,4 | f,4 e, d, e,
      \bar "|."
    }
  >>
  \layout { }
}
