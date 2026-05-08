\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Syntonic comma (81:80 = 21.5¢): Pythagorean E vs Just E above C
% Bar 1: Pythagorean E (four fifths up from C: 81/64 above C)
% Bar 2: Just E (pure major third: 5/4 = 80/64 above C)
% The difference = syntonic comma = 81:80
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      eis'1^\markup {
        \column {
          \small "Pythagorean E"
          \small "(81/64 ≈ 408¢)"
        }
      }
      e'1^\markup {
        \column {
          \small "Just E"
          \small "(5/4 = 80/64 ≈ 386¢)"
        }
      }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c1_\markup { \small "C (bass)" }
      c1^\markup { \small "syntonic comma = 21.5¢" }
    }
  >>
  \layout { }
}
