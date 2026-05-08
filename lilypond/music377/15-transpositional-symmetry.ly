\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Transpositional symmetry: whole-tone set {0,2,4,6,8,10} = T₆-invariant
% Treble = original WT0, Bass = T₆ version (same pitches, different octave)
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % Whole-tone set WT0: C D E F# G# Bb
        c'8^\markup { \tiny "WT₀ {0,2,4,6,8,10}" }
        d'8 e'8 fis'8 gis'8 ais'8
        |
        % T₆ transposes each PC by 6: {6,8,10,0,2,4} = same set!
        fis'8^\markup { \tiny "T₆WT₀ = WT₀" }
        gis'8 ais'8 c''8 d''8 e''8
        |
        % Conclusion: invariant under T₂, T₄, T₆, T₈, T₁₀
        <c' d' e' fis' gis' ais'>2^\markup { \small "T₆-invariant" }
        r4
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 3/4
        fis8^\markup { \tiny "T₆: F♯ G♯ B♭ C D E" }
        gis8 bes8 c'8 d'8 e'8
        |
        c8 d8 e8 fis8 gis8 ais8
        |
        <fis, gis, ais, c d e>2^\markup { \tiny "same 6 PCs" }
        r4
      }
    }
  >>
  \layout { }
}
