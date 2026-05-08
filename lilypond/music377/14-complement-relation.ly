\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Complement relation: S = {0,4,7} C-E-G vs complement {1,2,3,5,6,8,9,10,11}
% Musical context: set heard melodically first, then complement shown
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % S = {0,4,7}: C E G as a gesture
        c'4^\markup { \tiny "S = {0,4,7}" }
        e'4 g'4
        |
        <c' e' g'>2^\markup { \tiny "C major trichord" }
        r4
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 3/4
        % Complement = {1,2,3,5,6,8,9,10,11}: all 9 remaining PCs
        des8^\markup { \tiny "S̄ = complement (9 pcs)" }
        d8 ees8 f8 fis8 aes8
        |
        <des, d, ees, f, fis, aes,>2^\markup { \tiny "{1,2,3,5,6,8,9,10,11}" }
        r4
      }
    }
  >>
  \layout { }
}
