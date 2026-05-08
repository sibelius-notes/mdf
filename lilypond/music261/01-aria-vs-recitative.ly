\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Contrast between recitative and aria styles
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bars 1-2: Recitative — declamatory, syllabic, speech rhythm
      \mark \markup { \bold "Recit." }
      e'4 f'4 e'4 r8 d'8 |
      c'4 g'4 f'4 r4 |
      % Bars 3-4: Aria — lyrical, melismatic, ornamental
      \mark \markup { \bold "Aria" }
      \time 3/4
      c''4.\mf ( b'8 a'8 g'8 |
      a'4 g'4 \trill f'4 ) |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Recitative: sparse bass chords
      <c e g>2 r2 |
      <g, b, d>2 r2 |
      % Aria: richer Alberti-style bass
      \time 3/4
      c4 < e g>4 <e g>4 |
      g,4 <b, d>4 <b, d>4 |
    }
  >>
  \layout { }
}
