\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Pythagorean comma: 12 stacked perfect fifths overshoot 7 octaves by 23.46¢
% Bar 1: C (7 octaves) vs B# (12 fifths) — notated as whole notes on GrandStaff
% Bar 2: the wolf fifth problem — Eb vs G# (diminished 6th instead of P5)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c''1^\markup { \small "C (7 octaves = 2⁷)" }
      gis'1^\markup { \small "G♯ (wolf fifth upper note)" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c1^\markup {
        \column {
          \small "B♯ (12 fifths = (3/2)¹²)"
          \small "≈ C + 23.46¢ (Pythagorean comma)"
        }
      }
      ees1^\markup { \small "E♭ (wolf fifth lower note ≈ 737¢, not 702¢)" }
    }
  >>
  \layout { }
}
