\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Guide tone voice leading through Dm7-G7-Cmaj7: 7th→3rd→7th→3rd descent
\score {
  <<
    \new ChordNames {
      \chordmode {
        d1:m7 g1:7 c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Upper guide tones: 7th descends to 3rd of next chord
        c'1^\markup { \tiny "7th" } |
        b1^\markup { \tiny "3rd→7th" } |
        e'1^\markup { \tiny "3rd" } |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Lower guide tones: 3rd moves to 7th of next chord
        f1_\markup { \tiny "3rd" } |
        f1_\markup { \tiny "7th" } |
        b1_\markup { \tiny "7th held" } |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
