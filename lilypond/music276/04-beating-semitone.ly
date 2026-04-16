\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <a' bes'>1^\markup { \small "Minor 2nd: A4–Bb4 (440–466 Hz, beat ~26 Hz)" }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c'' cis''>1^\markup { \small "Semitone: C5–C#5 (523–554 Hz, beat ~31 Hz)" }
    }
  >>
  \layout { }
}
