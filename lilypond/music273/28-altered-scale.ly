\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G altered scale (mode 7 of Ab melodic minor): G Ab Bb B Db Eb F
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    g4 aes bes b des' ees' f' g'
  }
  \layout { }
}
