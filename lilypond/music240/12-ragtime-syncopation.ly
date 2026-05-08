\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Ragtime syncopation: RH syncopated melody, LH march bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/4 \omit Score.BarNumber
      \tempo "March tempo"
      % Syncopated RH: off-beat accentuation
      e'8 g'8~ g'16 a'16 g'8 |
      e'16 g'16 e'8~ e'16 d'16 c'8 |
      a'8 g'8~ g'16 f'16 e'8 |
      c'8 e'8 g'4 |
    }
    \new Staff {
      \clef bass \key c \major \time 2/4 \omit Score.BarNumber
      % March bass: oom-pah
      c,8_\markup { \tiny "I" } <e g>8 c,8 <e g>8 |
      g,,8_\markup { \tiny "V" } <d g>8 g,,8 <d g>8 |
      f,8_\markup { \tiny "IV" } <a c'>8 f,8 <a c'>8 |
      c,8_\markup { \tiny "I" } <e g>8 c,4 |
    }
  >>
  \layout { }
}
