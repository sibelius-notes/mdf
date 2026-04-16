\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  {
    \clef treble \key a \minor \time 8/4
    \omit Score.BarNumber
    a'4^\markup { \italic "ascending (raised 6 & 7)" } b' c'' d'' e'' fis'' gis'' a'' |
    a''4_\markup { \italic "descending (natural 6 & 7)" } g'' f'' e'' d'' c'' b' a'
    \bar "|."
  }
  \layout { }
}
