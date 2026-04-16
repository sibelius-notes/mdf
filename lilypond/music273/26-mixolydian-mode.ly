\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G Mixolydian scale (mode V of C major) — for V7 chord
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    g4 a b c' d' e' f' g'
  }
  \layout { }
}
