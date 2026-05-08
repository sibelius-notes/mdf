\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% ii-V-I in C, Bb, Eb back-to-back: melody + simple resolution line + bass
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d2:m7 g2:7 c1:maj7
        c2:m7 f2:7 bes1:maj7
        bes2:m7 ees2:7 aes1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Key of C: Dm7-G7-Cmaj7 resolution line
        f'4^\markup { \tiny "key of C" } a'4 b'4 e'4 |
        e'1 |
        % Key of Bb: Cm7-F7-Bbmaj7 resolution line
        ees'4^\markup { \tiny "key of B♭" } g'4 a'4 d'4 |
        d'1 |
        % Key of Eb: Bbm7-Eb7-Abmaj7 resolution line
        des'4^\markup { \tiny "key of A♭" } f'4 g'4 c'4 |
        c'1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        d2 g,2 |
        c2 g,2 |
        c2 f,2 |
        bes,2 f,2 |
        bes,2 ees,2 |
        aes,2 ees,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
