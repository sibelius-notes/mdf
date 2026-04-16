\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \minor \time 4/4
      \omit Score.BarNumber
      % Upper voice sustained
      e'1 e'1 d'1 d'1
    }
    \new Staff {
      \clef bass \key a \minor \time 4/4
      \omit Score.BarNumber
      % Chromatic bass descent A–G#–G–F#–F–E
      a,1 gis,1 g,1 fis,1
      f,1 e,1
    }
  >>
  \layout { }
}
