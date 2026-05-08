\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G Lydian dominant lick over G7#11: characteristic = C# (#4) + F (b7)
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        g2:7.11+ g2:7.11+ g1:7.11+
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Bar 1: leap up to B (3rd), slide through C# (#11) down to F (b7)
        g'8 b'8 cis''8 b'8 a'8 f'8 e'8 d'8 |
        % Bar 2: motivic repeat, unresolved shimmer on C#
        f'8 a'8 cis''4~ cis''8 b'8 a'4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g,4 b,4 f4 e4 |
        g,2 d2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
