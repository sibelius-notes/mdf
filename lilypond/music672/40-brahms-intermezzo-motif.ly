\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 7.3 — Brahms Op. 118 No. 2: motivic parallelism
% Descending sixth C#→E at surface and as middleground Sextzug
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup \tiny "Surface" } {
      \clef treble \key a \major \time 3/8 \omit Score.BarNumber
      % Opening descending sixth: C#5→A4→G#4→F#4→E4
      cis''4.^"3̂ (C#)" b'8 a'8 gis'8
      fis'4.^"(F#)" e'4.^"E"
    }
    \new Staff \with { instrumentName = \markup \tiny "MG Sextzug" } {
      \clef treble \key a \major \time 3/8 \omit Score.BarNumber
      cis''4.^"3̂" b'4.^"2̂"
      a'4.^"1̂"
    }
  >>
  \layout { indent = 1.8\cm }
}
