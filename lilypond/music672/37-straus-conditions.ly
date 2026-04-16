\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Definition 8.1 — Straus's four conditions: tonal vs. post-tonal contrast
% Left side: tonal (consonance/dissonance clear); right side: chromatic ambiguity
\score {
  \new Staff {
    \clef treble \time 4/4 \omit Score.BarNumber
    % Tonal: clear I–V–I with passing tone
    \key c \major
    e''2^"tonal 3̂" d''2^"2̂"
    c''1^"1̂"
    % Bar line then chromatic passage
    \bar "||"
    \key c \major
    ees''2^"chromatic?" des''2
    cis''1
  }
  \layout { }
}
