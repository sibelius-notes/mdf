\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Dm7 voicing: 4 bars of comping with stepwise melody
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d1:m7 d1:m7 d1:m7 d1:m7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Melody: step pattern F-E-D-C then back up
        f'4 e'4 d'4 c'4 |
        a'2 f'2 |
        c'4 e'4 f'2 |
        d'1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        <d f a c'>2 <d f a c'>2 |
        <d f a c'>2 <a, c e g>2 |
        <d f a c'>2 <f a c' e'>2 |
        <d f a c'>1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
