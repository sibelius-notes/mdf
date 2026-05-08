\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Note durations proportional to Krumhansl probe-tone weights: C≈7, E≈6.4, G≈6.1, D≈4.5
    c'2^\markup { \tiny "C: weight 7.0" }
    e'4.^\markup { \tiny "E: 6.4" }
    g'4^\markup { \tiny "G: 6.1" }
    d'8^\markup { \tiny "D: 4.5" }
  }
  \header { piece = \markup { \bold "Tonal Hierarchy: Krumhansl Probe-Tone Weights" } }
  \layout { }
}
