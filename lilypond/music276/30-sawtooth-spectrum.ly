\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Sawtooth rhythm: accent on each downbeat with staccato decay
  c8->\mf c8 d8-> d8 e8-> e8 r4 |
  e8-> e8 d8-> d8 c2-> |
}

lower = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  % Pedal C bass throughout
  c2._\markup { \tiny "sawtooth: all harmonics present" } c4 |
  c1 |
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "Sawtooth Waveform: All Harmonics Present" } }
  \layout { }
}
