\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Aristoxenus: diatonic tetrachord descending — four notes spanning a perfect fourth
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    e''1^\markup { \small "tetrachord" }
    d''1
    c''1
    b'1_\markup { \small "span = perfect fourth" }
  }
  \layout { }
}
