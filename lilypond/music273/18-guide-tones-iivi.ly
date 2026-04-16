\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Guide tone voice leading through Dm7 - G7 - Cmaj7
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Upper guide tones: 7th of each chord
      c'1 f'1 b1
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Lower guide tones: 3rd of each chord
      f1 b1 e'1
    }
  >>
  \layout { }
}
