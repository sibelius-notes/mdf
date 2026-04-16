\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Lippius trias harmonica: radix (root), medius (third), summus (fifth)
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \relative c' {
      <c e g>1^\markup {
        \column { \small "radix=C" \small "medius=E" \small "summus=G" }
      }
    }
  }
  \layout { }
}
