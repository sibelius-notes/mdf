\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Example 4.2 — Terzug (third-progression) with passing harmony
% G major: bass moves G→B (Terzug), passing A harmonized by D major (IV)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key g \major \time 3/4 \omit Score.BarNumber
      d''2.^"5̂" c''2.^"4̂" b'2.^"3̂"
    }
    \new Staff {
      \clef bass \key g \major \time 3/4 \omit Score.BarNumber
      g,2._"I" a,2._"IV pass." b,2._"III"
    }
  >>
  \layout { }
}
