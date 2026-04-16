\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef bass \key g \major \time 3/4
    \omit Score.BarNumber
    %% ||: A :|| First reprise: G major → D major
    \repeat volta 2 {
      g,2.^"A: I (G)" |
      a,2. |
      b,2.^"→ V" |
      d2.^"D: PAC"
    }
    %% ||: B :|| Second reprise: D major → G major
    \repeat volta 2 {
      d2.^"B: V (D)" |
      e2. |
      a,2.^"→ I" |
      g,2.^"G: PAC"
    }
  }
  \layout { }
}
