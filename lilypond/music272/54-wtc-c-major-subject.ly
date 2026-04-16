\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    c'16^\markup { \small "WTC I, Prelude C major — arpeggio figuration (first bar)" }
    e' g' c'' e'' g' c'' e'' | c''16 e'' g'' c''' e''' g'' c''' e'''
    \bar "|."
  }
  \layout { }
}
