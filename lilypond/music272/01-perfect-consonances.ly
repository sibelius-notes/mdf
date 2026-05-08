\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Perfect consonances: P5 and P8 approached by contrary/oblique motion
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Counterpoint voice: approach P5 (bar 2) and P8 (bar 4) by contrary motion
      e'2 d'2 |
      g'1^\markup { "P5" } |
      f'2 e'2 |
      c''1^\markup { "P8" } |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Cantus firmus in bass: whole notes
      c1 |
      c1 |
      f1 |
      c1 |
    }
  >>
  \layout { }
}
