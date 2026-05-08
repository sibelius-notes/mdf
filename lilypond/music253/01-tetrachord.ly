\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Diatonic tetrachord: T T S"
}

\score {
  \new Staff {
    \clef treble
    \key c \major
    \time 4/4
    \omit Staff.TimeSignature
    e'1
    ^\markup { \small "T" }
    d'1
    ^\markup { \small "T" }
    c'1
    ^\markup { \small "S" }
    b1
  }
  \layout { }
}
