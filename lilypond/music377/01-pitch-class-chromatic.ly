\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Chromatic aggregate: all 12 PCs saturated in a passage
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        c'8^\markup { \tiny "0" }
        cis'8^\markup { \tiny "1" }
        d'8^\markup { \tiny "2" }
        dis'8^\markup { \tiny "3" }
        e'8^\markup { \tiny "4" }
        f'8^\markup { \tiny "5" }
        |
        fis'8^\markup { \tiny "6" }
        g'8^\markup { \tiny "7" }
        gis'8^\markup { \tiny "8" }
        a'8^\markup { \tiny "9" }
        bes'8^\markup { \tiny "10" }
        b'8^\markup { \tiny "11" }
        |
        c''2.^\markup { \small "chromatic aggregate" }
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 3/4
        c2.^\markup { \tiny "C pedal" }
        |
        c2.
        |
        c2.
      }
    }
  >>
  \layout { }
}
