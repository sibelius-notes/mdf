\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G altered lick (G7alt) featuring b9/b13, resolving to Cmaj7
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        g2:7.9-.13- g2:7.9-.13- c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Bar 1: altered tensions aes (b9) and ees (b13) prominently
        aes'8 bes'8 b'8 des''8 ees''8 des''8 bes'8 aes'8 |
        % Bar 2 (G7alt) resolves via guide-tone F to E in Cmaj7
        f'4. b8~ b4 aes'8 f'8 |
        e'1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g,4 des4 f,4 b,4 |
        g,2 b,2 |
        c2 e2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
