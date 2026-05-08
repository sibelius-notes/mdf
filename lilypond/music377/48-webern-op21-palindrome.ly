\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Webern Op.21 palindrome: P0 and R6 with varied durations
% Dotted 8ths and 16ths to suggest Webern's sparse style
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        % P0: 0 11 3 4 8 7 — varied durations
        c'8.\pp^\markup { \tiny "P₀" }
        b16~ b8 ees'8. e'16~ e'4
        |
        aes'16\p ees'8. g'4 r2
        |
        r1
        |
        r1
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        r1
        |
        r1
        |
        % R6 enters — palindromic retrograde
        e'8.^\markup { \tiny "R₆" }
        b'16~ b'8 g'8. aes'16~ aes'4
        |
        ees'16\p c'8. b8 r4 r4
      }
    }
  >>
  \layout { }
}
