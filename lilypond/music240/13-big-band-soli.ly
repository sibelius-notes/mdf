\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Big band soli: 3 voices in parallel block chords, 4 bars
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key bes \major \time 4/4 \omit Score.BarNumber
      \tempo "Swing"
      % Soli block chords — top two voices
      <d'' f''>4\mf <c'' ees''>4 <bes' d''>4 <g' c''>4 |
      <a' c''>4 <bes' d''>4 <c'' ees''>2 |
      <d'' f''>4 <f'' a''>4 <ees'' g''>4 <d'' f''>4 |
      <c'' ees''>2 <bes' d''>2 |
    }
    \new Staff {
      \clef bass \key bes \major \time 4/4 \omit Score.BarNumber
      % Third soli voice + bass
      bes4_\markup { \tiny "Bb7" } aes4_\markup { \tiny "Eb7" }
        g4_\markup { \tiny "Bb" } ees4_\markup { \tiny "Cm7" } |
      f4_\markup { \tiny "F7" } g4_\markup { \tiny "Bb" }
        aes2_\markup { \tiny "Eb7" } |
      bes4_\markup { \tiny "Bb7" } d'4_\markup { \tiny "Bb7" }
        c'4_\markup { \tiny "Eb7" } bes4_\markup { \tiny "Bb7" } |
      aes2_\markup { \tiny "Eb" } bes2_\markup { \tiny "Bb" } |
    }
  >>
  \layout { }
}
