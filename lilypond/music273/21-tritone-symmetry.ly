\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G7 and Db7 share the same tritone B-F (= Cb)
\score {
  <<
    \new ChordNames {
      \chordmode { g1:7 des1:7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % G7: G B D F — tritone B-F
      <g b d' f'>1
      % Db7: Db F Ab Cb — tritone F-Cb(=B)
      <des f aes ces'>1
    }
  >>
  \layout { }
}
