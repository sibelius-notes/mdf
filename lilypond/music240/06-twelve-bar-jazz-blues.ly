\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% 12-bar jazz blues in F: treble = blues head, bass = walking bass
\score {
  <<
    \new ChordNames {
      \chordmode {
        f1:7 | bes1:7 | f1:7 | f1:7 |
        bes1:7 | bes1:7 | f1:7 | d1:7 |
        g1:m7 | c1:7 | f1:7 | c1:7 |
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key f \major \time 4/4 \omit Score.BarNumber
        f'8 ees'8 f'8 aes'8 bes'4 bes'8 c''8 |
        bes'8 aes'8 g'8 f'8 ees'4 ees'8 f'8 |
        f'8 ees'8 f'8 aes'8 c''4 bes'8 aes'8 |
        g'4 f'4 ees'4 d'4 |
        bes8 d'8 f'8 bes'8 c''4 bes'8 aes'8 |
        g'8 aes'8 bes'4 bes'8 aes'8 g'8 f'8 |
        f'8 ees'8 f'8 aes'8 c''4 bes'8 aes'8 |
        a'8 g'8 fis'8 f'8 e'8 ees'8 d'8 des'8 |
        c'8 d'8 ees'8 f'8 g'4 aes'8 g'8 |
        f'8 g'8 a'8 bes'8 c''4 bes'8 aes'8 |
        g'8 f'8 ees'8 d'8 c'4 c'8 bes8 |
        c'4 g4 c'2 |
      }
      \new Staff {
        \clef bass \key f \major \time 4/4 \omit Score.BarNumber
        f,4 a,4 c4 ees4 |
        bes,,4 d,4 f,4 aes,4 |
        f,4 a,4 c4 ees4 |
        f,4 e,4 ees,4 d,4 |
        bes,,4 d,4 f,4 aes,4 |
        bes,,4 d,4 f,4 aes,4 |
        f,4 a,4 c4 ees4 |
        d,4 fis,4 a,4 c4 |
        g,,4 bes,,4 d,4 f,4 |
        c,4 e,4 g,4 bes,4 |
        f,4 a,4 c4 ees4 |
        c,4 e,4 g,4 bes,4 |
      }
    >>
  >>
  \layout { }
}
