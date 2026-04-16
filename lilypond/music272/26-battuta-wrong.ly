\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 12\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'4^\markup { \bold "✗" \italic "battuta: P5 crossing barline" } d' e' f' | g'4 a' b' c''
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      f,4 g, a, bes, | c4 d e f
      \bar "|."
    }
  >>
  \layout { }
}
