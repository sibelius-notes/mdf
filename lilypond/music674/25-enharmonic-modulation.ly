\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% 19th-century enharmonic modulation: C major → Db major via diminished seventh pivot
\score {
  <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c' e' g'>1^\markup { \small "C major" }
      <b ees' g' a'>1^\markup { \small "dim7 pivot" }
      \key des \major
      <des' f' aes'>1^\markup { \small "D♭ major" }
    }
  >>
  \layout { }
}
