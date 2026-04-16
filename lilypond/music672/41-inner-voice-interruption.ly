\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 5.4 — Inner-voice motion at interruption: leading tone 7̂ implies resolution
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      << {
        % Urlinie soprano
        e''1^"3̂" d''1^"2̂ |"
      } \\ {
        % Inner voice leading tone B (7̂) at interruption
        g'2 b'2^"7̂→"
      } >>
      % Second part
      e''1^"3̂ restart"
      d''2^"2̂" c''2^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,1_"I" g,,1_"V" c,1_"I" g,,2_"V" c,2_"I"
    }
  >>
  \layout { }
}
