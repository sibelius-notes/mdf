\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G half-whole diminished lick over G7b9: symmetric motivic cells (minor 3rd apart)
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        g2:7.9- g2:7.9- g1:7.9-
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Bar 1: 3-note cell [G Ab Bb] then transposed up m3 [Bb B Cis]
        g'8 aes'8 bes'8 r8 bes'8 b'8 cis''8 r8 |
        % Bar 2: cell transposed up again [Cis D E] then back down
        cis''8 d''8 e''8 r8 e''8 d''8 b'8 g'8 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g,4 b,4 d4 f4 |
        g,4 aes,4 b,4 d4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
