\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% ii-V-I in C: guide-tone voice-leading 7→3, 3→7 + bass (3 staves)
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d2:m7 g2:7 c1:maj7
      }
    }
    \new StaffGroup <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Melody: simple quarter-note top voice
        f'4^\markup { \tiny "3rd" } a'4 g'4 b'4 |
        e'1^\markup { \tiny "3rd" } |
        \bar "|."
      }
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Guide tones: 7th of Dm7 (C) → 3rd of G7 (B) → 7th of Cmaj7 (B held) → 3rd (E)
        c'2^\markup { \tiny "7th" } b2^\markup { \tiny "3rd" } |
        b2^\markup { \tiny "7th" } e'2^\markup { \tiny "3rd" } |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        d2 g,2 |
        c2 g,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
