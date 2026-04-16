\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Meantone temperament: the wolf fifth Eb–G# (diminished sixth, ~737¢ instead of 702¢)
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' g'>1^\markup { \small "pure 5th (702¢)" }
    <ees' gis'>1^\markup { \small "wolf 5th E♭–G♯ (~737¢)" }
  }
  \layout { }
}
