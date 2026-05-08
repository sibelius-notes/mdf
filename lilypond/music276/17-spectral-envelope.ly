\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Piano: short staccato notes with fp — sharp attack
  c4-.\fp^\markup { \tiny "Piano: ADSR sharp attack" } r4 c4-.\fp r4 |
  c4-.\fp r4 c4-.\fp r4 |
}

lower = \relative c' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Organ: long sustained with hairpins — flat sustain
  c2\mf\< c2\! |
  c2\> c2\mf\! |
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "Spectral Envelope: Piano vs. Organ ADSR" } }
  \layout { }
}
