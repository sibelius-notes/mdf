\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Equal temperament: chromatic scale as democratization of all 12 semitones
% Treble = chromatic scale C–B in eighth notes with cent labels
% Bass = cycle-of-fifths annotations (every fifth = exactly 700¢ in ET)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'8^\markup { \tiny "0¢" }
      cis'8^\markup { \tiny "100¢" }
      d'8^\markup { \tiny "200¢" }
      ees'8^\markup { \tiny "300¢" }
      e'8^\markup { \tiny "400¢" }
      f'8^\markup { \tiny "500¢" }
      fis'8^\markup { \tiny "600¢" }
      g'8^\markup { \tiny "700¢" }
      aes'8^\markup { \tiny "800¢" }
      a'8^\markup { \tiny "900¢" }
      bes'8^\markup { \tiny "1000¢" }
      b'8^\markup { \tiny "1100¢" }
      c''2^\markup { \tiny "1200¢" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2_\markup { \small "P5 in ET = 700¢ (exact)" }
      g,2
      c,2_\markup { \small "every fifth equal" }
      g,,2
    }
  >>
  \layout { }
}
