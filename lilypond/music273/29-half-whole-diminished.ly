\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G half-whole diminished scale (dominant diminished): G Ab Bb B C# D E F
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    g4 aes bes b cis' d' e' f'
  }
  \layout { }
}
