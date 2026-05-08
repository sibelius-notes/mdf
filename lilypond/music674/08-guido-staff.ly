\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Guido d'Arezzo's staff invention: before and after comparison
% Top staff: neume-like pitches without bar lines (free rhythm, imprecise)
% Bottom staff: same pitches on Guido's 4-line staff with precise placement + solmization
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup { \tiny "Pre-Guido" } } {
      \clef treble
      \omit Score.BarNumber
      \omit Score.TimeSignature
      \cadenzaOn
      c'4^\markup { \small "no staff lines: pitch approximate" }
      d'4 e'4 f'4 e'4 d'4 c'4
      \bar "|."
    }
    \new Staff \with { instrumentName = \markup { \tiny "Guido" } } {
      \clef "petrucci-c1"
      \omit Score.BarNumber
      \omit Score.TimeSignature
      \cadenzaOn
      c'4 d'4 e'4 f'4 e'4 d'4 c'4
      \bar "|."
    }
    \addlyrics { ut re mi fa mi re ut }
  >>
  \layout { }
}
