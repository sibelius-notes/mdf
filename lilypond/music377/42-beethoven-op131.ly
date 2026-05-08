\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Beethoven Op.131 RL chain with voice-leading lines showing L and R transformations
% C#min → E maj → G#min → B maj → D#min → F# maj
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        % Voice-leading soprano line: R keeps common tone, L moves semitone
        % C#min → E maj (R: G# common, E# → E already present, B→B)
        gis'2^\markup { \tiny "G♯ (R→)" }
        gis'2^\markup { \tiny "G♯  E maj" }
        |
        % E maj → G#min (L: E common, G#→G# common, B→B)
        b'2^\markup { \tiny "B  (L→)" }
        b'2^\markup { \tiny "B  G♯ min" }
        |
        % G#min → B maj (R: D# enters)
        dis''2^\markup { \tiny "D♯  (R→)" }
        dis''2^\markup { \tiny "D♯  B maj" }
        |
        fis''2^\markup { \tiny "F♯  (L→F♯ maj)" }
        r2
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        \time 4/4
        <cis' e' gis'>2^\markup { \tiny "C♯ min" }
        <e' gis' b'>2^\markup { \tiny "R→E maj" }
        |
        <gis' b' dis''>2^\markup { \tiny "L→G♯ min" }
        <b' dis'' fis''>2^\markup { \tiny "R→B maj" }
        |
        <dis'' fis'' ais''>2^\markup { \tiny "L→D♯ min" }
        <fis'' ais'' cis'''>2^\markup { \tiny "R→F♯ maj" }
        |
        r1
      }
    }
  >>
  \layout { }
}
