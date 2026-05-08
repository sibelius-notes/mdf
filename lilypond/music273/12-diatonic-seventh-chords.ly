\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% All 7 diatonic seventh chords in C major, GrandStaff with bass roots, half-note comping
\score {
  <<
    \new ChordNames {
      \chordmode {
        c2:maj7 d2:m7 e2:m7 f2:maj7 g2:7 a2:m7 b2:m7.5-
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Half-note voicings showing each diatonic seventh chord
        <c e g b>2 <d f a c'>2 |
        <e g b d'>2 <f a c' e'>2 |
        <g b d' f'>2 <a c' e' g'>2 |
        <b d' f' a'>2 r2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Bass roots cycle through I-VII
        c2_\markup { \tiny "I" } d2_\markup { \tiny "II" } |
        e2_\markup { \tiny "III" } f,2_\markup { \tiny "IV" } |
        g,2_\markup { \tiny "V" } a,2_\markup { \tiny "VI" } |
        b,2_\markup { \tiny "VII" } r2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
