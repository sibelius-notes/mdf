\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Whole-tone lick over C7(#11#5): floating, directionless "Maiden Voyage" quality
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c2:7.11+.5+ c2:7.11+.5+ c1:7.11+.5+
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Bar 1: ascending whole-tone arpeggio gesture, all whole steps
        c'8 d'8 e'8 fis'8 gis'8 ais'8 c''4 |
        % Bar 2: float back down, no leading tone resolution — suspended
        ais'8 gis'8 fis'8 e'8~ e'4 d'4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        c2 gis,2 |
        c2 e2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
