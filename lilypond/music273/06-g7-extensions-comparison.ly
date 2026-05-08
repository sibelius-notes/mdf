\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G7 vs G9 vs G13 on GrandStaff: extension building with half-note rhythm
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        g1:7 g1:9 g1:13
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % G7 shell: tritone B-F preserved throughout
        <b f'>2^\markup { \tiny "G7: 3rd+7th" } <b f'>2 |
        % G9: add ninth A
        <b f' a'>2^\markup { \tiny "G9: +9th" } <b f' a'>2 |
        % G13: add thirteenth E (omit fifth)
        <b f' e''>2^\markup { \tiny "G13: +13th" } <b f' e''>2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g2_\markup { \tiny "V7" } d2 |
        g2_\markup { \tiny "V9" } d2 |
        g2_\markup { \tiny "V13" } d2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
