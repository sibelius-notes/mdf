\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Schenker Ursatz: Urlinie (3-2-1 descent) + Bassbrechung (I-V-I) sketch
\score {
  <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Urlinie: scale degrees 3-2-1
      e''1^\markup { \small "3̂" }
      d''1^\markup { \small "2̂" }
      c''1^\markup { \small "1̂" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % Bassbrechung: I-V-I
      c1_\markup { \small "I" }
      g,1_\markup { \small "V" }
      c1_\markup { \small "I" }
    }
  >>
  \layout { }
}
