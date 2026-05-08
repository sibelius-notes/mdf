\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Wagner "fate" style leitmotif: 4-note descending chromatic motif with chromatic harmony
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key d \minor
      \time 4/4
      \omit Score.BarNumber
      ^ \markup { \italic "fate motif (descending chromatic)" }
      d''2_\markup{\small "A7"} cis''2 | c''2_\markup{\small "Dm"} b'2 |
      bes'2_\markup{\small "G7"} a'2_\markup{\small "Dm"} |
      gis'2_\markup{\small "E7"} a'1_\markup{\small "Am"} |
    }
    \new Staff {
      \clef bass
      \key d \minor
      \time 4/4
      <a, cis e>2 <d, a,>2 | <a, c e>2 <gis, b,>2 |
      <g, b, d>2 <a, e>2 | <gis, b, e>2 <a, e a>2 |
    }
  >>
  \layout { }
}
