\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      a'1~^\markup { \small "Vibrato: ±Δf pitch oscillation (5–8 Hz)" }
      a'1 |
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      a'4\f_\markup { \small "Tremolo: amplitude modulation" } a'4\p a'4\f a'4\p |
      a'4\f a'4\p a'4\f a'4\p |
    }
  >>
  \layout { }
}
