\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schubert Erlkönig style — vocal melody + galloping bass
melody = \relative c'' {
  \clef treble
  \key d \minor
  \time 3/4
  \omit Score.BarNumber
  % bar 1
  a4 a8 g f a |
  % bar 2
  g4 f8 e f4 |
  % bar 3
  a4 bes8 a g f |
  % bar 4
  e2. |
}
words = \lyricmode {
  Der Er- lkö- nig rei- tet ge- schwind,
  rei- tet ge- schwind rei- tet
  durch Nacht und Wind.
}
bass = \relative c {
  \clef bass
  \key d \minor
  \time 3/4
  \omit Score.BarNumber
  % gallop: triplet 8ths, Schubertian accompaniment pattern
  \repeat unfold 4 {
    \tuplet 3/2 { a8 e' a, } \tuplet 3/2 { a8 e' a, } \tuplet 3/2 { a8 e' a, } |
  }
}
\score {
  \new GrandStaff <<
    \new Staff {
      \new Voice = "mel" \melody
      \new Lyrics \lyricsto "mel" \words
    }
    \new Staff \bass
  >>
  \layout { }
}
