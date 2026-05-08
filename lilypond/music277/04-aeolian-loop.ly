% Aeolian loop i–VII–VI–VII in A minor: Stairway to Heaven, Burn, Don't Fear the Reaper.
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  a1:m g1 f1 g1
}

melody = {
  \clef treble \key a \minor \time 4/4
  \omit Score.BarNumber
  a'4 c''4 e''4 c''4 |
  b'4 g'4 d'4 g'4 |
  a'4 f'4 c'4 f'4 |
  g'4 b'4 d''4 b'4 |
  \bar "|."
}

bassline = {
  \clef bass \key a \minor \time 4/4
  \omit Score.BarNumber
  a,2 e2 |
  g,2 d2 |
  f,2 c2 |
  g,2 d2 |
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
