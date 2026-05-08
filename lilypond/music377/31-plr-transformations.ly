\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% PLR transformations on C major with soprano voice leading
% C major → P → C minor → L → Eb major → R → Ab major
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        % Soprano voice leading through P, L, R transformations
        % C maj → C min: E→Eb (P moves third by semitone)
        e'2^\markup { \tiny "E" }
        ees'2^\markup { \tiny "E♭  (P)" }
        |
        % C min → Eb maj: C→Eb (L moves fifth by semitone in minor → major)
        ees'2^\markup { \tiny "E♭" }
        ees'2^\markup { \tiny "E♭  (L→E♭ maj)" }
        |
        % Eb maj → Ab maj: Eb→Eb (R keeps common tones)
        ees'2^\markup { \tiny "E♭" }
        ees'2^\markup { \tiny "E♭  (R→A♭ maj)" }
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        \time 4/4
        % Full chord context
        <c' e' g'>2^\markup { \tiny "C maj" }
        <c' ees' g'>2^\markup { \tiny "P→C min" }
        |
        <ees' g' bes'>2^\markup { \tiny "L→E♭ maj" }
        <ees' g' bes'>2
        |
        <aes g' ees'>2^\markup { \tiny "R→A♭ maj" }
        r2
      }
    }
  >>
  \layout { }
}
