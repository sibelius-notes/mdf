\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% D Dorian lick over Dm7: characteristic note = B natural (raised 6th)
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d2:m7 d2:m7 d1:m7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Bar 1: enclosure lick landing on the raised-6th B natural
        a'8 g'8 f'8 e'8 d'4 b'8( a'8) |
        % Bar 2: resolve back through F, land on D
        g'8 e'8 f'8 d'8~ d'4 r4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Bass comping: roots and fifths in quarter notes
        d2 a,2 |
        d,4 f,4 a,4 c4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
