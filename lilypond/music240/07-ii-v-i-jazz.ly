\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% ii-V-I in Bb major: guide tone line with walking bass
\score {
  <<
    \new ChordNames {
      \chordmode {
        c1:m7 | f1:7 | bes1:maj7 |
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key bes \major \time 4/4 \omit Score.BarNumber
        \once \override Score.RehearsalMark.self-alignment-X = #LEFT
        \mark \markup { \small \italic "ii–V–I guide tones" }
        ees'2 g'2 |
        ees'2 f'2 |
        d'2 f'2 |
      }
      \new Staff {
        \clef bass \key bes \major \time 4/4 \omit Score.BarNumber
        c,4 ees,4 g,4 bes,4 |
        f,,4 a,,4 c,4 ees,4 |
        bes,,4 d,4 f,4 a,4 |
      }
    >>
  >>
  \layout { }
}
