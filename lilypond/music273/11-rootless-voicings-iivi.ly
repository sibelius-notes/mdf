\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { d1:m9 g1:13 c1:maj9 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Dm9 rootless: F A C E (3rd, 5th, 7th, 9th)
      <f a c' e'>1
      % G13 rootless: F B E (7th, 3rd, 13th)
      <f b e'>1
      % Cmaj9 rootless: B E G D (7th, 3rd, 5th, 9th)
      <b e' g' d''>1
    }
  >>
  \layout { }
}
