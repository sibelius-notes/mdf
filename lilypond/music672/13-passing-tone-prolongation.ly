\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Definition 4.1 — Passing tone in the prolongational context
% Bass Terzug I–III with passing II (D-major chord) in G major
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key g \major \time 3/4 \omit Score.BarNumber
      d''2.^"structural" d''2. d''2.
    }
    \new Staff {
      \clef bass \key g \major \time 3/4 \omit Score.BarNumber
      g,2._"I" a,4_"passing" a,2. b,2._"III"
    }
  >>
  \layout { }
}
