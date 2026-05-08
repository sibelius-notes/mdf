\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% ii-V-I descending by whole step through C, Bb, Ab (Coltrane "Moment's Notice" sequence):
% bebop 8th-note melody targeting chord tones on downbeats, with walking bass.
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
        % Key of C: Dm7-G7-Cmaj7
        f'8^\markup { \tiny "key of C" } e'8 d'8 c'8 b8 d'8 f'8 a'8 |
        g'8 e'8 c'8 g8 e'2 |
        % Key of Bb: Cm7-F7-Bbmaj7
        ees'8^\markup { \tiny "key of B♭" } d'8 c'8 bes8 a8 c'8 ees'8 g'8 |
        f'8 d'8 bes8 f8 d'2 |
        % Key of Ab: Bbm7-Eb7-Abmaj7
        des'8^\markup { \tiny "key of A♭" } c'8 bes8 aes8 g8 bes8 des'8 f'8 |
        ees'8 c'8 aes8 ees8 c'2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Walking bass — chord tones on beats 1 and 3
        d4 f4 a4 c4 |
        g,4 b,4 c4 bes,4 |
        c4 ees4 g4 bes4 |
        f,4 a,4 bes,4 aes,4 |
        bes,4 des4 f4 aes4 |
        ees,4 g,4 aes,4 r4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
