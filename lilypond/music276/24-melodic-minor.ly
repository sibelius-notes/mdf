\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \minor \time 8/4
      \omit Score.BarNumber
      a'1^\markup { \small "Melodic minor (ascending)" }
      b'1 cis''1 d''1 e''1 fis''1 gis''1 a''1
    }
    \new Staff {
      \clef treble \key a \minor \time 8/4
      \omit Score.BarNumber
      a'1_\markup { \small "Harmonic minor" }
      b'1 c''1 d''1 e''1 f''1 gis''1 a''1
    }
  >>
  \layout { }
}
