\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Chromatic bass ascent — late Romantic / Tristanesque chromaticism
upper = \relative c'' {
  \clef treble
  \time 4/4
  \omit Score.BarNumber
  % sustained upper harmony while bass rises chromatically
  <e g b>1~ |
  <e g b>1~ |
  <e g b>1~ |
  <e g b>1 |
}
lower = \relative c {
  \clef bass
  \time 4/4
  \omit Score.BarNumber
  % chromatic bass ascent: C - C# - D - D# - E
  c1^\markup { \italic "chrom." } |
  cis1^\markup { "↑ chrom." } |
  d1^\markup { "↑ chrom." } |
  dis1^\markup { "↑ chrom." } |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
