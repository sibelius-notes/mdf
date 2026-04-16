\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% D Dorian scale (mode II of C major)
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    d'4 e' f' g' a' b' c'' d''
  }
  \layout { }
}
