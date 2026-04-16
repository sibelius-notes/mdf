\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Species counterpoint: first-species (note against note) pair, Fux style
\score {
  <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Counterpoint voice (above)
      e''1^\markup { \tiny "CP" }
      d''1
      c''1
      d''1
      e''1
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % Cantus firmus (below)
      c1_\markup { \tiny "CF" }
      f1
      a1
      g1
      c1
    }
  >>
  \layout { }
}
