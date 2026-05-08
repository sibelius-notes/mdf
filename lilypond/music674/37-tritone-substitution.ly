\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tritone substitution in jazz/20th-century theory:
% Standard ii-V-I vs tritone-sub version (Dm7-Db7-Cmaj7)
% The Db7 substitutes G7 because both share guide tones B/F (enharmonic Cb/F)
\score {
  <<
    \new ChordNames {
      \chordmode {
        % Standard ii7-V7-I
        d2:m7 d2:m7 g2:7 g2:7 c2:maj7 c2:maj7 |
        % Tritone sub
        d2:m7 d2:m7 des2:7 des2:7 c2:maj7 c2:maj7
      }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Standard: Dm7 - G7 - Cmaj7
      <d' f' a' c''>2^\markup { \small "Dm7" }
      <d' f' a' c''>2 |
      <g b d' f'>2^\markup { \small "G7" }
      <g b d' f'>2 |
      <c' e' g' b'>2^\markup { \small "Cmaj7" }
      <c' e' g' b'>2 \bar "||"
      % Tritone sub: Dm7 - Db7 - Cmaj7
      <d' f' a' c''>2^\markup { \small "Dm7" }
      <d' f' a' c''>2 |
      <des' f' aes' ces''>2^\markup { \small "D♭7 (tritone sub for G7)" }
      <des' f' aes' ces''>2 |
      <c' e' g' b'>2^\markup { \small "Cmaj7" }
      <c' e' g' b'>2 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % Standard bass: D G C
      d2 d2 |
      g,2 g,2 |
      c2 c2 \bar "||"
      % Tritone sub bass: D Db C (chromatic descent)
      d2 d2 |
      des2_\markup { \small "D♭→C chromatic bass" } des2 |
      c2 c2 \bar "|."
    }
  >>
  \layout { }
}
