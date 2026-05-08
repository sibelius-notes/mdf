\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tritone B-F in G7 resolves inward by half step to C-E in Cmaj7
\score {
  <<
    \new ChordNames {
      \chordmode {
        g2:7 c2:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Upper voice: B resolves up by half step to C
        b2^\markup { \tiny "B (3rd of G7)" } c'2^\markup { \tiny "→ C (root)" } |
        \bar "|."
      }
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Lower voice: F resolves down by half step to E
        f2^\markup { \tiny "F (7th of G7)" } e2^\markup { \tiny "→ E (3rd)" } |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
