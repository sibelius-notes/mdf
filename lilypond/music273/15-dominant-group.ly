\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Dominant group: G7 and Bm7b5 — both contain tritone B-F, half-note comping with bass
\score {
  <<
    \new ChordNames {
      \chordmode {
        g2:7 b2:m7.5-
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Dominant group: V7, VIIm7b5 — share tritone B-F
        <g b d' f'>2^\markup { \tiny "V7" } <b d' f' a'>2^\markup { \tiny "VII∅7" } |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g,2_\markup { \tiny "V" } b,2_\markup { \tiny "VII" } |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
