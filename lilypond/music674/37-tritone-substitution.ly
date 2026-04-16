\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Jazz tritone substitution: G7 → Db7 → Cmaj (guide tones B/F exchange roles)
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <g' b' f''>1^\markup { \small "G7 (V7)" }
    <des' f' ces''>1^\markup { \small "D♭7 (triSub)" }
    <c' e' g'>1^\markup { \small "I (C maj)" }
  }
  \layout { }
}
