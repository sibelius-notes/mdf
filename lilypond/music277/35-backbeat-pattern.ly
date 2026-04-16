\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new DrumStaff {
    \drummode {
      \time 4/4
      \omit Score.BarNumber
      % Classic rock backbeat: hi-hat 8ths, kick on 1&3, snare on 2&4
      <<
        { hh8 hh8 hh8 hh8 hh8 hh8 hh8 hh8 }
        { bd4 sn4 bd4 sn4 }
      >> |
      <<
        { hh8 hh8 hh8 hh8 hh8 hh8 hh8 hh8 }
        { bd4 sn4 bd4 sn4 }
      >> |
    }
  }
  \layout { }
}
