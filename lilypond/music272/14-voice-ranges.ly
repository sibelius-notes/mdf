\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \omit Score.BarNumber
      << {
        \override NoteHead.color = #red
        c''1^\markup { \small "S: C4–G5" }
      } \\ {
        \override NoteHead.color = #blue
        g1_\markup { \small "A: G3–C5" }
      } >>
    }
    \new Staff {
      \clef bass
      << {
        \override NoteHead.color = #darkgreen
        c1^\markup { \small "T: C3–G4" }
      } \\ {
        \override NoteHead.color = #black
        e,,1_\markup { \small "B: E2–C4" }
      } >>
    }
  >>
  \layout { }
}
