\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% 4-voice ii-V-I: Treble = soprano+alto; Bass = tenor+bass; guide-tone labels
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d2:m7 g2:7 c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Soprano (top) + Alto (inner)
        % Dm7: F (soprano) C (alto); G7: D (soprano) B (alto); Cmaj7: E (soprano) B (alto)
        <c' f'>2^\markup { \tiny "7th→3rd" } <b d'>2 |
        <b e'>1^\markup { \tiny "7th" } |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Tenor (inner) + Bass
        % Dm7: A (tenor) D (bass); G7: F (tenor) G (bass); Cmaj7: G (tenor) C (bass)
        <d a>2^\markup { \tiny "3rd→7th" } <g, f>2 |
        <c g>1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
