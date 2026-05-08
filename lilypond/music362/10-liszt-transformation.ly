\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Liszt thematic transformation: lyrical → heroic → march
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      % Bars 1-2: original lyrical theme
      \mark \markup { \bold "Original (lyrical)" }
      c''4\p ( e''4 g''4 ) |
      e''2 d''4 |
      % Bars 3-4: heroic transformation (4/4, forte, wide intervals)
      \time 4/4
      \mark \markup { \bold "Heroic" }
      c''4\f c'''4 g''4 e'''4 |
      c'''2 g''2 |
      % Bars 5-6: march version (2/4, staccato)
      \time 2/4
      \mark \markup { \bold "March" }
      c''8.\f c''16 e''8. e''16 |
      g''4 c'''4 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      % Original: sustained
      c2.\p |
      g,2. |
      % Heroic: strong chords
      \time 4/4
      <c e g>2\f <g, b, d>2 |
      <c e g>1 |
      % March: staccato bass
      \time 2/4
      c4.\f g,8 |
      c4 c4 \bar "|."
    }
  >>
  \layout { }
}
