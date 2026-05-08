\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G7 and Db7 share the same tritone B-F (= Cb): acoustic foundation of tritone sub
\score {
  <<
    \new ChordNames {
      \chordmode {
        g2:7 des2:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % G7: G B D F — tritone B-F; Db7: same tritone, roles swapped
        <b d' f'>2^\markup { \tiny "G7: B=3rd, F=7th" }
        <f aes ces'>2^\markup { \tiny "D♭7: F=3rd, C♭=7th" } |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g,2_\markup { \tiny "G" } des2_\markup { \tiny "D♭ (tritone away)" } |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
