\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% C melodic minor (jazz minor): C D Eb F G A B
\score {
  \new Staff {
    \clef treble \key c \minor \time 4/4
    \omit Score.BarNumber
    c'4 d' ees' f' g' a' b' c''
  }
  \layout { }
}
