\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Antiphon (Dorian mode)"
}

\score {
  \new Staff {
    \override Staff.TimeSignature.stencil = ##f
    \override Score.BarLine.transparent = ##t
    \clef treble
    \key c \major
    d'8 f'8 g'8 a'8 g'8 f'8 e'8 d'8
  }
  \layout { }
}
