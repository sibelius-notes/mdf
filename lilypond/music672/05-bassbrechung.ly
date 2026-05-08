\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Section 2.3 — Bassbrechung (I–V–I) with Urlinie (3̂–2̂–1̂) in C major
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      % Urlinie: 3̂–2̂–1̂ (E–D–C) as half notes
      e''2.^\markup { "3̂" } |
      d''2.^\markup { "2̂" } |
      c''2.^\markup { "1̂" } |
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      % Bassbrechung: I–V–I (C–G–C) as whole notes (dotted half in 3/4)
      c2.^"I"( |
      g,2.^"V" |
      c2.)^"I" |
    }
  >>
  \layout { }
}
