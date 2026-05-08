\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Compare: standard Dm7-G7-Cmaj7 vs backdoor Fm7-Bb7-Cmaj7
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d2:m7 g2:7 c1:maj7
        f2:m7 bes2:7 c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Standard ii-V-I melody
        f'2^\markup { \tiny "standard ii–V–I" } b'2 |
        c''1 |
        % Backdoor approach: Bb7 resolves up a whole step to C
        f'2^\markup { \tiny "backdoor ii–V–I" } ees'2 |
        c''1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        d2_\markup { \tiny "G→C" } g,2 |
        c2 e2 |
        % Backdoor: Bb approaches C from whole step below
        f,2_\markup { \tiny "B♭→C" } bes,2 |
        c2 g,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
