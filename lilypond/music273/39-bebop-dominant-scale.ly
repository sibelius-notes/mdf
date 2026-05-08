\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G bebop dominant: 8th-note run landing chord tones on downbeats, over G7
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
        % Bar 1: descending bebop scale from D, chord tones (D B G F) on beats 1+2+
        d''8 c''8 b'8 a'8 g'8 fis'8 f'8 e'8 |
        % Bar 2: continue descent, D landing beat 1, resolve to G
        d'8 c'8 b8 a8 g4 r4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g,4 b,4 d4 f4 |
        g,4 b,4 d4 g4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
