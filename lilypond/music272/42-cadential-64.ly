\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      << { c''2^\markup { \small "cad. ⁶₄ → V → I" } b'2 c''2 }
         \\ { e'2 d'2 e'2 } >>
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      g2 g2 c2
    }
  >>
  \layout { }
}
