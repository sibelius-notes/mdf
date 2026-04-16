\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key a \minor \time 4/4
    \omit Score.BarNumber
    % Aeolian loop: i-VII-VI-VII in A minor
    \chordmode {
      a1:m | g | f | g |
    }
  }
  \layout { }
}
