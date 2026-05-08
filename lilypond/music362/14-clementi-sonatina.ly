\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Clementi sonatina texture: melody + Alberti bass, 4 bars in C major
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      \tempo "Allegretto"
      % Clean, singing melody
      e'4 f'4 g'4 a'4 |
      g'2 e'2 |
      f'4 e'4 d'4 c'4 |
      c'1 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Alberti bass: low-high-mid-high pattern
      \repeat unfold 4 { c8 g8 e8 g8 } |
      \repeat unfold 4 { g,8 d8 b,8 d8 } |
      \repeat unfold 4 { f,8 c8 a,8 c8 } |
      \repeat unfold 4 { c8 g8 e8 g8 } |
    }
  >>
  \layout { }
}
