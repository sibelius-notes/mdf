\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key a \minor \time 4/4
    \omit Score.BarNumber
    % Andalusian cadence: i-VII-VI-V in A minor (descending bass)
    \chordmode {
      a1:m | g | f | e |
    }
  }
  \layout { }
}
