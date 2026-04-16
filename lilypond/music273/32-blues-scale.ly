\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% C blues scale: C Eb F F# G Bb C
\score {
  \new Staff {
    \clef treble \key f \major \time 4/4
    \omit Score.BarNumber
    c'4 ees' f' fis' g' bes' c''2
  }
  \layout { }
}
