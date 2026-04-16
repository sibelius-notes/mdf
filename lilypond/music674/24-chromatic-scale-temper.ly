\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Renaissance equal temperament attempt: chromatic scale C to C
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    c'4^\markup { \small "≈ET" } cis'4 d'4 dis'4
    e'4 f'4 fis'4 g'4
    gis'4 a'4 ais'4 b'4
    c''1
  }
  \layout { }
}
