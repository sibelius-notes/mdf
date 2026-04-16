\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Definition 2.1 — Urlinie: Fifth-line Ursatz (5̂–4̂–3̂–2̂–1̂) with I–V–I bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 5/4 \omit Score.BarNumber
      % Soprano Urlinie beamed: open noteheads
      g''1^"5̂" f''1^"4̂" e''1^"3̂" d''1^"2̂" c''1^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 5/4 \omit Score.BarNumber
      % I–V–I bass with slur
      c,1^"I"( c,1 c,1 g,,1^"V") c,1^"I"
    }
  >>
  \layout { }
}
