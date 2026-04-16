\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G whole-tone scale: G A B C# D# F (fits G7#5)
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    g4 a b cis' dis' f' g'2
  }
  \layout { }
}
