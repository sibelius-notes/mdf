\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 1.4 — Auskomponierung: composing out a C-major triad across time
% Single tonic triad composed out with neighbor notes, passing tones, arpeggiation
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Soprano composes out C major: c–d–e–g–f–e–d–c
      c''4 d''4 e''4 g''4
      f''4 e''4 d''4 c''4
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Bass sustains tonic pedal throughout
      c,1_"I prolonged"
      c,1_"I"
    }
  >>
  \layout { }
}
