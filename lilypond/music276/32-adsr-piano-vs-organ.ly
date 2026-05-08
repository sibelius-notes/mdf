\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Piano ADSR: sharp attack (fp), fast decay
  c4\fp^\markup { \tiny "Piano: sharp attack, decay" } c4\mp c4\p c4\pp |
  c4\fp c4\mp c4\p c4\pp |
}

lower = \relative c' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Organ ADSR: flat sustain at even dynamic
  c1\mf_\markup { \tiny "Organ: flat sustain" } |
  c1\mf |
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "ADSR: Piano vs. Organ" } }
  \layout { }
}
