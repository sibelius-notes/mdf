\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Bar 1: masker alone (loud C4)
    c'1\ff_\markup { \tiny "masker C4 (ff)" } |
    % Bar 2: masker + masked tone simultaneously
    <<
      { c'1\ff_\markup { \tiny "masker C4 (ff)" } }
      { e'1\pp^\markup { \tiny "masked? E4 (pp)" } }
    >> |
  }
  \header { piece = \markup { \bold "Auditory Masking: Simultaneous" } }
  \layout { }
}
