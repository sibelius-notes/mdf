\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Just intonation C major scale: whole notes with ratio markup
% Treble = melody; Bass = fundamental C pedal
% Ratios: 1/1  9/8  5/4  4/3  3/2  5/3  15/8  2/1
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'1^\markup { \small "1/1" }
      d'1^\markup { \small "9/8" }
      e'1^\markup { \small "5/4" }
      f'1^\markup { \small "4/3" }
      g'1^\markup { \small "3/2" }
      a'1^\markup { \small "5/3" }
      b'1^\markup { \small "15/8" }
      c''1^\markup { \small "2/1" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c1_\markup { \small "C pedal" }
      c1
      c1
      c1
      c1
      c1
      c1
      c1
    }
  >>
  \layout { }
}
