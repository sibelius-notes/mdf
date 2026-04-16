\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G dominant bebop scale: G A B C D E F F# (Mixolydian + natural 7th passing tone)
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    g'4 a' b' c'' d'' e'' f'' fis''
  }
  \layout { }
}
