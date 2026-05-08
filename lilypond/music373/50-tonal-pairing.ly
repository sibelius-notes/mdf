\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tonal pairing: two-key Sonata where I (C major) and vi (A minor) are both structural
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bars 1–2: theme in C major (I)
      c''4^\markup { "I" } e''4 g''4 e''4 |
      d''4 c''2 r4 |
      % Bars 3–4: theme transposed to A minor (vi)
      a'4^\markup { "vi" } c''4 e''4 c''4 |
      b'4 a'2 r4 |
      % Bars 5–6: return to C major (I)
      c''4^\markup { "I" } e''4 g''4 a''4 |
      g''4 e''4 c''2 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Tonic roots of each key as whole notes
      c1 |
      c1 |
      a,1 |
      a,1 |
      c1 |
      c1 |
    }
  >>
  \layout { }
}
