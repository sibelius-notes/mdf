\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% C half-whole diminished scale: C C# D# E F# G A Bb
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    c'4 cis' dis' e' fis' g' a' bes'
  }
  \layout { }
}
