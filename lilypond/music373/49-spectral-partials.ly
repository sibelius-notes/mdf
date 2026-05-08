\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Spectral harmony: harmonic series partials 4–8 over C2 fundamental
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1: ascending 8th-note arpeggio of partials 4–8 (G3 C4 E4 G4 Bb4)
      g8^\markup { "Spectral harmony: harmonic series as form" }
        c' e' g' bes'4 r4 |
      % Bar 2: same arpeggio continued, leading to sustained chord in bar 3
      g8 c' e' g' bes'4 r4 |
      % Bar 3: sustained chord of partials 4–8
      << { bes'1 } \\ { g'1 } \\ { e'1 } \\ { c'1 } >> |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Fundamental C2 (written as c,, in LilyPond — bass clef low C)
      c,,1_"C2 (fundamental)" |
      c,,1 |
      c,,1 |
    }
  >>
  \layout { }
}
