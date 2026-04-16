\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Definition 1.1 — Structural Levels (Schichten): three-staff diagram
% showing Hintergrund, Mittelgrund, Vordergrund
\score {
  \new GrandStaff <<
    \new Staff \with { instrumentName = \markup \tiny "Vordergrund" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Foreground: all surface events
      c''4^"fg" e''8 f'' g''4 a''8 g''
      f''4 e'' d''2
      e''4 d'' c''1
    }
    \new Staff \with { instrumentName = \markup \tiny "Mittelgrund" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Middleground: structural notes only
      e''2^"3̂" d''2^"2̂"
      e''2 d''2
      c''1^"1̂"
    }
    \new Staff \with { instrumentName = \markup \tiny "Hintergrund" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Background: Ursatz only
      e''1^"3̂" d''1^"2̂"
      c''2.^"1̂" r4
    }
  >>
  \layout { indent = 2.5\cm }
}
