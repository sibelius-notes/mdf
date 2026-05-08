\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Four bars at increasing dynamics with dB labels
    c'1\pp^\markup { \tiny "pp ≈ 30 dB" } |
    c'1\mp^\markup { \tiny "mp ≈ 60 dB" } |
    c'1\mf^\markup { \tiny "mf ≈ 75 dB" } |
    c'1\ff^\markup { \tiny "ff ≈ 90 dB" } |
  }
  \header { piece = \markup { \bold "Loudness and Dynamic Levels" } }
  \layout { }
}
