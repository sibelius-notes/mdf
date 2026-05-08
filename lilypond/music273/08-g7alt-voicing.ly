\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G7alt rootless voicing + bass, 4 bars comping, resolves to Cmaj7
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        g1:7.9-.9+.11+.13- g1:7.9-.9+.11+.13- g1:7.9-.9+.11+.13- c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % G7alt rootless: B-F-Ab-Eb (3rd, 7th, b9, b13)
        <b f' aes' ees''>2^\markup { \tiny "G7alt" } <b f' aes' ees''>2 |
        <b f' aes' ees''>2 <des' f' b>2 |
        <aes des' f' b>2 <b f' aes' ees''>2 |
        % Resolution to Cmaj7
        <c e g b>1^\markup { \tiny "Cmaj7" } |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g,2 des2 |
        g,2 des2 |
        aes,2 g,2 |
        c2 g,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
