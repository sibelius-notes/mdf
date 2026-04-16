\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new StaffGroup <<
    \new DrumStaff \with { drumStyleTable = #congas-style } {
      \drummode {
        \time 4/4
        \omit Score.BarNumber
        % Simplified: hi-hat (hh), snare (sn), kick (bd)
        hh8 hh8 hh8 hh8 hh8 hh8 hh8 hh8 |
        bd4 sn4 bd4 sn4 |
        hh8 hh8 hh8 hh8 hh8 hh8 hh8 hh8 |
        bd4 sn4 bd4 sn4 |
      }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % Bass groove pattern
      c,8 r8 c,8 r8 g,8 r8 c,8 r8 |
      c,8 r8 c,8 r8 g,8 r8 bes,8 r8 |
      c,8 r8 c,8 r8 g,8 r8 c,8 r8 |
      c,8 r8 c,8 r8 g,4 r4 |
    }
  >>
  \layout { }
}
