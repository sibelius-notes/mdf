\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \minor \time 4/4
      \omit Score.BarNumber
      %% Phrygian half cadence: iv6 → V in A minor
      a'4^"iv6" c''4 e''2 | gis'4^"V (Phryg. HC)" b'4 e''2 \bar "|."
    }
    \new Staff {
      \clef bass \key a \minor \time 4/4
      \omit Score.BarNumber
      f,4 a,4 c2 | e,4 gis,4 e2 \bar "|."
    }
  >>
  \layout { }
}
