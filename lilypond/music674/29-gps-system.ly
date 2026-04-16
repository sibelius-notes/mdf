\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Greater Perfect System (GPS): two-octave scale A2-A4 in ancient Greek notation context
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    \omit Score.TimeSignature
    \cadenzaOn
    a,4^\markup { \small "proslambanomenos" }
    b,4 c4 d4 e4 f4 g4
    a4^\markup { \small "mese" }
    b4 c'4 d'4 e'4 f'4 g'4
    a'4^\markup { \small "nete hyperbolaion" }
    \bar "|."
  }
  \layout { }
}
