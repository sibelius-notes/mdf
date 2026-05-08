\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Just major triad as overtone harmony: partials 4, 5, 6 of C2
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1: partials 4, 5, 6 individually labeled
      c''4^\markup { \small "4th" }
      e''4^\markup { \small "5th" }
      g''4^\markup { \small "6th" }
      r4
      |
      % Bar 2: C-E-G block chord (just triad)
      << c'' e'' g'' >>1^\markup { \small "4:5:6" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % C2 fundamental
      c,1_\markup { \small "C2 fund." }
      |
      c,1_\markup { \small "C major" }
    }
  >>
  \header {
    piece = \markup { \small "Partials 4:5:6 of C2 = C4-E4-G4 = just major triad" }
  }
  \layout { }
}
