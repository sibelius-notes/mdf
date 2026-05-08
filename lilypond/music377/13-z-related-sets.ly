\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Z-related pair: [4-Z15](0146) and [4-Z29](0137) — same iv <111111>
% Musical context: each set heard as a gesture before the label
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % [4-Z15] (0146): C Db E F#  as atonal gesture
        c'8^\markup { \tiny "[4-Z15] (0146)" }
        des'8 e'4 fis'4
        |
        <c' des' e' fis'>2^\markup { \tiny "iv ⟨111111⟩" }
        r4
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % [4-Z29] (0137): C Db Eb G  as atonal gesture
        c'8^\markup { \tiny "[4-Z29] (0137)" }
        des'8 ees'4 g'4
        |
        <c' des' ees' g'>2^\markup { \tiny "iv ⟨111111⟩  (Z-pair)" }
        r4
      }
    }
  >>
  \layout { }
}
