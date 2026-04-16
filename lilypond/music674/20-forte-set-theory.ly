\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Forte set theory: pitch-class set {0,3,7} = minor triad (3-11) on staff
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' ees' g'>1^\markup { \small "{0,3,7} = 3-11 (minor triad)" }
    <c' e' g'>1^\markup { \small "{0,4,7} = 3-11 (major triad)" }
  }
  \layout { }
}
