\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 3.4 — Stufe: a scale step as prolonged harmonic region
% Single I Stufe governs many surface harmonies
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Prolonged tonic: soprano stays on E (3̂) through many surface chords
      e''4^"3̂" f''4 g''4 a''4
      g''4 f''4 e''4 d''4
      e''2 d''2
      c''1^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,4_"I——————————" f,,4 g,,4 a,,4
      g,,4 f,,4 e,,4 d,,4
      c,2 g,,2_"V" c,1_"I"
    }
  >>
  \layout { }
}
