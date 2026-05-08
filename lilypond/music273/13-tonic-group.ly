\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tonic group: Cmaj7, Em7, Am7 — half-note comping with bass, showing shared tones
\score {
  <<
    \new ChordNames {
      \chordmode {
        c2:maj7 e2:m7 a2:m7 r2
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Tonic group: Imaj7, IIIm7, VIm7 — all share tones E G B
        <c e g b>2^\markup { \tiny "Imaj7" } <e g b d'>2^\markup { \tiny "IIIm7" } |
        <a c' e' g'>2^\markup { \tiny "VIm7" } r2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        c2_\markup { \tiny "I" } e,2 |
        a,2 r2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
