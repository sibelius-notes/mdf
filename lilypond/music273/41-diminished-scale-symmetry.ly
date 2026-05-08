\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Diminished scale in symmetric 3-note groups over Bdim7/G7b9: octatonic symmetry
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
        % Bar 1: cell [C# D# E] then up m3 to [E F# G], then [A Bb C]
        cis'8 dis'8 e'8 r8 e'8 fis'8 g'8 r8 |
        % Bar 2: final cell [A Bb C] completing octatonic group, resolve down
        a'8 bes'8 c''8 r8 b'4 g'4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g,4 b,4 des4 e4 |
        g,4 aes,4 b,4 d4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
