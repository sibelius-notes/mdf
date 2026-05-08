\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Pythagorean consonances: four perfect intervals on GrandStaff
% Each bar: approach note then dyad in half-note rhythm; ratio markup above dyad
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % bar 1: unison 1:1
      d'2 c'2^\markup { \small "1:1 unison" }
      % bar 2: octave 2:1
      b2 c''2^\markup { \small "2:1 octave" }
      % bar 3: fifth 3:2
      f'2 g'2^\markup { \small "3:2 fifth" }
      % bar 4: fourth 4:3
      e'2 f'2^\markup { \small "4:3 fourth" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2 c2
      c2 c2
      c2 c2
      c2 c2
    }
  >>
  \layout { }
}
