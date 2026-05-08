\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Coltrane changes: major-third cycle resolving to Cmaj7
\score {
  <<
    \new ChordNames {
      \chordmode {
        c1:m7 | ees1:7 | aes1:maj7 | b1:7 | e1:maj7 | g1:7 | c1:maj7 |
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4 \omit Score.BarNumber
        \once \override Score.RehearsalMark.self-alignment-X = #LEFT
        \mark \markup { \small \italic "Coltrane changes (major-3rd cycle)" }
        g'4 aes'4 bes'4 c''4 |
        bes'4 g'4 ges'4 ees'4 |
        ees'4 f'4 g'4 aes'4 |
        dis'4 fis'4 ais'4 b'4 |
        gis'4 b'4 dis''4 e''4 |
        f'4 g'4 a'4 b'4 |
        c''1 |
      }
      \new Staff {
        \clef bass \key c \major \time 4/4 \omit Score.BarNumber
        c,1 |
        ees,1 |
        aes,,1 |
        b,,1 |
        e,1 |
        g,,1 |
        c,1 |
      }
    >>
  >>
  \layout { }
}
