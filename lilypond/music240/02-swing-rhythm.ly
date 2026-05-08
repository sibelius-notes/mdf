\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Swing vs. straight rhythm comparison
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    \mark \markup { \small \italic "Straight (even 8ths)" }
    c'8 d'8 e'8 g'8 c'8 d'8 e'8 g'8 |
    \mark \markup { \small \italic "Swing (long–short)" }
    \tuplet 3/2 { c'4 d'8 }
    \tuplet 3/2 { e'4 g'8 }
    \tuplet 3/2 { c'4 d'8 }
    \tuplet 3/2 { e'4 g'8 } |
  }
  \layout { }
}
