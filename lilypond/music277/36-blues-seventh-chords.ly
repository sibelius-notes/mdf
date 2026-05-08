% Blues I7–I7–IV7–I7 in C: each chord is a dominant seventh. Melody uses blue 3rd (Eb), flat 7th (Bb). The "blues sound" comes from the minor-inflected melody over major-function harmony.
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  c1:7 c1:7 f1:7 c1:7
}

melody = {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  ees'8 g'8 bes'4 g'8 f'8 ees'4 |
  c'4 ees'4 g'4 bes'4 |
  f'8 bes'8 a'8 f'8 ees'4 c'4 |
  bes4 c'4 ees'4 g'4 |
  \bar "|."
}

bassline = {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c2 bes,2 |
  c2 g,2 |
  f,2 ees2 |
  c2 g,2 |
  \bar "|."
}

\score {
  <<
    \new ChordNames \harmScheme
    \new GrandStaff <<
      \new Staff \melody
      \new Staff \bassline
    >>
  >>
  \layout { }
}
