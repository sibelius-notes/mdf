\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { g1:7.9-.9+.11+.13- }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % G7alt: G B F Ab Bb Db Eb
      <g b f' aes' bes' des'' ees''>1
    }
  >>
  \layout { }
}
