\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Pythagorean tuning: chain of seven perfect fifths (C-G-D-A-E-B-F#) in treble
% compared simultaneously with the C major diatonic scale in bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'1^\markup { \small "C  1:1" }
      g'1^\markup { \small "G  3:2" }
      d''1^\markup { \small "D  9:8" }
      a'1^\markup { \small "A  27:16" }
      e''1^\markup { \small "E  81:64" }
      b'1^\markup { \small "B  243:128" }
      fis''1^\markup { \small "F♯ 729:512" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c1_\markup { \small "C scale" }
      d1
      e1
      f1
      g1
      a1
      b1
    }
  >>
  \layout { }
}
