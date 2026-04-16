\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Example 5.1 — Interrupted structure in a minuet (G major, 5̂ primary tone)
% First reprise: 5̂–4̂–3̂–2̂ | Second reprise: 5̂–4̂–3̂–2̂–1̂
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key g \major \time 3/4 \omit Score.BarNumber
      % First reprise: descent to 2̂, interruption
      d''2.^"5̂" c''2.^"4̂" b'2.^"3̂" a'2.^"2̂ |"
      % Second reprise: restart at 5̂, full descent
      d''2.^"5̂" c''2.^"4̂" b'2.^"3̂" a'2.^"2̂" g'2.^"1̂"
    }
    \new Staff {
      \clef bass \key g \major \time 3/4 \omit Score.BarNumber
      g,2._"I" g,2. g,2. d,2._"V"
      g,2._"I" g,2. g,2. d,2._"V" g,2._"I"
    }
  >>
  \layout { }
}
