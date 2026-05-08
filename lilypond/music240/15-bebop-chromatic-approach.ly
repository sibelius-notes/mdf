\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bebop chromatic approach tones: upper and lower chromatic neighbors
% before chord tones, over Bb7-Eb7 (bars 1-2)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key bes \major \time 4/4 \omit Score.BarNumber
      \tempo "Fast swing"
      % Bar 1: Bb7 — approach tones in brackets via markup
      c''16_\markup { \tiny "↓" } b'16_\markup { \tiny "chr." }
        bes'8._\markup { \tiny "Bb7 3rd" }
        e'16_\markup { \tiny "↑" } f'8.
        aes'16_\markup { \tiny "↑" } g'8 |
      % Bar 2: Eb7
      fis'16_\markup { \tiny "↓" } ees'8._\markup { \tiny "Eb7 R" }
        aes'16_\markup { \tiny "↑" } g'8
        d'16_\markup { \tiny "↓" } c'16 bes8 |
    }
    \new Staff {
      \clef bass \key bes \major \time 4/4 \omit Score.BarNumber
      % Steady chord comp
      bes,4_\markup { \tiny "Bb7" } <f aes d'>4 bes,4 <f aes d'>4 |
      ees,4_\markup { \tiny "Eb7" } <g bes des'>4 ees,4 <g bes des'>4 |
    }
  >>
  \layout { }
}
