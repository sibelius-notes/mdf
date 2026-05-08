\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Circle of fifths: 12 steps of 700c each in equal temperament
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      % 12 fifths: C G D A E B F# C# G# D# A# E#(=F)
      c'2._\markup { \small "700c" } |
      g'2._\markup { \small "700c" } |
      d''2._\markup { \small "700c" } |
      a'2._\markup { \small "700c" } |
      e''2._\markup { \small "700c" } |
      b'2._\markup { \small "700c" } |
      fis''2._\markup { \small "700c" } |
      cis''2._\markup { \small "700c" } |
      gis''2._\markup { \small "700c" } |
      dis''2._\markup { \small "700c" } |
      ais'2._\markup { \small "700c" } |
      eis''2._\markup { \small "closes circle" } |
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      c2. | c2. | c2. | c2. | c2. | c2. |
      c2. | c2. | c2. | c2. | c2. | c2. |
    }
  >>
  \header {
    piece = \markup { \small "12 x 700c = 8400c = 7 x 1200c: the circle closes in 12-TET" }
  }
  \layout { }
}
