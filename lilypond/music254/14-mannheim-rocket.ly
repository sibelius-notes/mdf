\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Mannheim rocket (ascending arpeggio fortissimo) followed by sigh gesture (falling 2nd)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      \omit Score.BarNumber
      ^ \markup { \italic "Mannheim rocket → sigh motive" }
      c'8_\markup{\small "rocket ↑"} e'8 g'8 c''8 e''8 g''8 c'''4 |
      b''4_\markup{\small "sigh ↓"} a''4 g''2 |
      g''8 e''8 c''8 g'8 e'8 c'8 e'4~ |
      e'2 c'2 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      c4 r4 r2 |
      g4 r4 c4 r4 |
      c4 r4 r2 |
      c2 g,2 |
    }
  >>
  \layout { }
}
