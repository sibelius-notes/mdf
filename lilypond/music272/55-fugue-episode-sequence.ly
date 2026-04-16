\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 4/4
      \omit Score.BarNumber
      f'4^\markup { \small "episode: sequential development of subject motive" } e' d' c' |
      e'4 d' c' b |
      d'4 c' b a |
      c'4 b a g
      \bar "|."
    }
    \new Staff {
      \clef bass \key d \minor \time 4/4
      d4 e f g |
      c4 d e f |
      bes,4 c d e |
      a,4 b, c d
      \bar "|."
    }
  >>
  \layout { }
}
