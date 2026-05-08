\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% C blues scale lick over C7: chromatic enclosure + b3/b5 inflections
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c2:7 c2:7 c1:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key f \major \time 4/4
        \omit Score.BarNumber
        % Bar 1: enclosure into G, then b5 (F#) chromatic tension
        ees'8 d'8 c'8 ees'8 fis'8 g'4 r8 |
        % Bar 2: descend through Bb (b7) and Eb (b3), classic blues ending
        bes'8 g'8 fis'8 f'8 ees'8 c'8 bes8 g8 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key f \major \time 4/4
        \omit Score.BarNumber
        c4 g,4 bes,4 ees4 |
        c4 g,4 c4 e4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
