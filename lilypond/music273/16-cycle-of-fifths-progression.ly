\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Cycle of fifths in C: Em7-Am7-Dm7-G7-Cmaj7, half-note with bass descending fifths
\score {
  <<
    \new ChordNames {
      \chordmode {
        e2:m7 a2:m7 d2:m7 g2:7 c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Half-note voicings cycling through fifths
        <e g b d'>2 <a c' e' g'>2 |
        <d f a c'>2 <g b d' f'>2 |
        <c e g b>1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Bass descends by perfect fifths
        e,2_\markup { \tiny "III" } a,2_\markup { \tiny "VI" } |
        d2_\markup { \tiny "II" } g,2_\markup { \tiny "V" } |
        c2_\markup { \tiny "I" } g,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
