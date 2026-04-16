\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Octave-line Ursatz (8̂–7̂–6̂–5̂–4̂–3̂–2̂–1̂) with I–V–I bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Soprano Urlinie: octave descent
      c'''1^"8̂" b''1^"7̂" a''1^"6̂" g''1^"5̂"
      f''1^"4̂" e''1^"3̂" d''1^"2̂" c''1^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,1^"I" c,1 c,1 c,1
      c,1 c,1 g,,1^"V" c,1^"I"
    }
  >>
  \layout { }
}
