\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Minor ii-V-i in G minor: Am7b5-D7b9-Gm with voice-leading
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        a2:m7.5- d2:7.9- g1:m6
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key g \minor \time 4/4
        \omit Score.BarNumber
        % Melody: quarter-note line showing half-dim → dom7b9 → minor resolution
        a'4 c''4 fis'4^\markup { \tiny "leading tone" } g'4 |
        bes'2 d''2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key g \minor \time 4/4
        \omit Score.BarNumber
        % Bass + guide tone annotations
        a,2^\markup { \tiny "ii∅7" } d,2^\markup { \tiny "V7♭9" } |
        g,2^\markup { \tiny "Im6" } d2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
