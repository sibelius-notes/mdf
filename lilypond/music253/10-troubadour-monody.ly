\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Troubadour/trouvère monophonic canso in Mode I (long-short pattern), Dorian on D
\score {
  \new Staff {
    \clef treble
    \key d \dorian
    \time 3/4
    \omit Score.BarNumber
    ^ \markup { \italic "canso – Rhythmic Mode I (long–short)" }
    d'2 e'4 | f'2 e'4 | d'4 e'4 f'4 | g'2 f'4 |
    e'2 d'4 | f'2 e'4 | d'2. |
  }
  \layout { }
}
