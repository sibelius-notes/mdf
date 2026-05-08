\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Whole-tone collection in Debussy style: parallel augmented triads (WT0 and WT1)
% GrandStaff: Treble = parallel augmented triads ascending, Bass = whole-tone bass line
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 2/4
        % WT0: C-E-G#, D-F#-A#  (augmented triads from WT0)
        <c' e' gis'>8^\markup { \tiny "WT₀: C aug" }
        <d' fis' ais'>8^\markup { \tiny "D aug" }
        <e' gis' cis''>8^\markup { \tiny "E aug" }
        r8
        \bar "||"
        % WT1: Db-F-A, Eb-G-B  (augmented triads from WT1)
        <des' f' a'>8^\markup { \tiny "WT₁: D♭ aug" }
        <ees' g' b'>8^\markup { \tiny "E♭ aug" }
        <f' a' des''>8^\markup { \tiny "F aug" }
        r8
        \bar "|."
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 2/4
        % WT0 bass line: C D E F# (whole-tone)
        c8^\markup { \tiny "WT₀ bass" }
        d8 e8 fis8
        \bar "||"
        % WT1 bass line: Db Eb F G
        des8^\markup { \tiny "WT₁ bass" }
        ees8 f8 g8
        \bar "|."
      }
    }
  >>
  \layout { }
}
