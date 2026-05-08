\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Standard I-vi-ii-V turnaround in C (4 bars) with counter-melody and bass roots
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c2:maj7 a2:7 d2:m7 g2:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Counter-melody top voice (simple quarter notes)
        e'4 cis'4 d'4 b4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Bass: roots I-vi-ii-V cycling back
        c2 a,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
