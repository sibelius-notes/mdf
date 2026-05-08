\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G Mixolydian lick over G7: characteristic note = F natural (b7, avoids leading-tone)
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        g2:7 g2:7 g1:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Bar 1: lick descending through the b7 (F), avoiding the leading tone
        d''8 b'8 g'8 f'8 e'8 d'8 b8 g8 |
        % Bar 2: ascending phrase featuring F natural prominently
        b8 d'8 f'4~ f'8 g'8 a'4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g,4 d4 b,4 f4 |
        g,4 b,4 d4 g4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
