\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Hexatonic collection {0,3,4,7,8,11} in Schubert-style progression
% Hexatonic pole: C maj → Ab maj → E maj (PLR cycle through hexatonic system)
% GrandStaff, 3 bars, PLR markup labels
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % C major: {0,4,7}
        <c' e' g'>2.^\markup { \tiny "C maj  (P)" }
        |
        % Ab major: {8,11,3}  — hexatonic neighbor
        <aes' c'' ees''>2.^\markup { \tiny "A♭ maj  (L)" }
        |
        % E major: hexatonic pole of C major {4,8,11}
        <e' gis' b'>2.^\markup { \tiny "E maj  hexatonic pole" }
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 3/4
        c2.^\markup { \tiny "{0,3,4,7,8,11} [6-20]" }
        |
        aes,2.
        |
        e,2.
      }
    }
  >>
  \layout { }
}
