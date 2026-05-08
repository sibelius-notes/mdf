\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Harmonic series on E2: partials 1-8 (Grisey Partiels reference)
% Bass = trombone fundamental E2; Treble = partials ascending
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        % Partials 4-8: E4 G#4 B4 D5 E5
        e'1^\markup { \tiny "k=4  E₄" }
        gis'1^\markup { \tiny "k=5  G♯₄" }
        b'1^\markup { \tiny "k=6  B₄" }
        d''1^\markup { \tiny "k=7  D₅ (−31¢)" }
        e''1^\markup { \tiny "k=8  E₅" }
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c,, {
        % Partials 1-3: E2 E3 B3
        e,1^\markup { \tiny "k=1  E₂  fundamental" }
        e1^\markup { \tiny "k=2  E₃" }
        b1^\markup { \tiny "k=3  B₃" }
        r1^\markup { \small "Grisey: Partiels (1975)" }
      }
    }
  >>
  \layout { }
}
