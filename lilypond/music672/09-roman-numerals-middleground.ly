\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 3.4 — Roman numerals at middleground vs. foreground level
% Middleground: I prolonged; foreground: I–IV–V–I
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Structural soprano
      e''1^"3̂" d''1^"2̂" c''1^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Foreground bass with Roman numerals labeled
      c,1_"I" f,,1_"IV" g,,1_"V" c,1_"I"
    }
  >>
  \layout { }
}
