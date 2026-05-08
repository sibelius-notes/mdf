\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Subdominant group: Dm7 and Fmaj7 — half-note comping with bass, shared tones
\score {
  <<
    \new ChordNames {
      \chordmode {
        d2:m7 f2:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Subdominant group: IIm7, IVmaj7 — share F A C
        <d f a c'>2^\markup { \tiny "IIm7" } <f a c' e'>2^\markup { \tiny "IVmaj7" } |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        d2_\markup { \tiny "II" } f,2_\markup { \tiny "IV" } |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
