\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Close voicing vs drop-2 of Cmaj7: 4 voicings in open spacing with labels
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c1:maj7 c1:maj7 c1:maj7 c1:maj7
      }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Close voicing root position: C E G B
      <c e g b>2^\markup { \tiny "close" } r2 |
      % Close voicing 1st inversion: E G B C
      <e g b c'>2^\markup { \tiny "close 1st inv" } r2 |
      % Drop-2 root position: C G B E (drop G down)
      <c, g b e'>2^\markup { \tiny "drop-2" } r2 |
      % Drop-2 1st inversion: E B C G
      <e, b c g'>2^\markup { \tiny "drop-2 1st inv" } r2 |
      \bar "|."
    }
  >>
  \layout { }
}
