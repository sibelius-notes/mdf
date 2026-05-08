\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Modal jazz: D Dorian (So What style) over Dm7
\score {
  <<
    \new ChordNames {
      \chordmode {
        d1:m7 | d1:m7 | d1:m7 | d1:m7 |
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4 \omit Score.BarNumber
        \once \override Score.RehearsalMark.self-alignment-X = #LEFT
        \mark \markup { \small \italic "D Dorian (So What style)" }
        d'4 e'4 f'4 g'4 |
        a'4 b'4 c''4 d''4 |
        c''4 b'4 a'4 g'4 |
        f'4 e'4 d'2 |
      }
      \new Staff {
        \clef bass \key c \major \time 4/4 \omit Score.BarNumber
        d,2 a,2 |
        d,2 a,2 |
        d,2 a,2 |
        d,1 |
      }
    >>
  >>
  \layout { }
}
