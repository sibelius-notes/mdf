\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Definition 2.1 — Urlinie: Third-line Ursatz (3̂–2̂–1̂) with I–V–I bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      % Soprano Urlinie: open noteheads, beamed
      \override NoteHead.style = #'harmonic-mixed
      e''2.^"3̂"~ e''2 d''4^"2̂" c''2.^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      % Bass arpeggiation I–V–I
      c2.^"I"~ c2 g,4^"V" c,2.^"I"
    }
  >>
  \layout { }
}
