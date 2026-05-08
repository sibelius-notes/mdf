\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Liszt thematic transformation: same 4-note cell in two guises
% (a) lyric/cantabile, (b) march/dotted — showing Liszt's "thematic transformation"
upper = \relative c'' {
  \clef treble
  \key a \major
  \time 3/4
  \omit Score.BarNumber
  % Version (a): lyrical, flowing — "cantabile" character
  a4^\markup { \italic "cantabile" } cis4 e4 |
  fis2.~ |
  fis4 e4 cis4 |
  a2. |
}
lower = \relative c {
  \clef bass
  \key a \major
  \time 3/4
  \omit Score.BarNumber
  <a e'>2.\p |
  <a e'>2. |
  <a e'>2. |
  <a e'>2. |
}
upperB = \relative c'' {
  \clef treble
  \key a \major
  \time 2/4
  \omit Score.BarNumber
  % Version (b): march, dotted rhythms — same pitches, transformed character
  a8.^\markup { \italic "marciale" } cis16 e8. fis16 |
  fis4 r4 |
  e8. cis16 a8. r16 |
  a4 r4 |
}
lowerB = \relative c {
  \clef bass
  \key a \major
  \time 2/4
  \omit Score.BarNumber
  <a e'>8\f r8 <a e'>8 r8 |
  <a e'>8 r8 r4 |
  <a e'>8 r8 <a e'>8 r8 |
  <a e'>4 r4 |
}
\score {
  <<
    \new GrandStaff <<
      \new Staff \upper
      \new Staff \lower
    >>
    \new GrandStaff <<
      \new Staff \upperB
      \new Staff \lowerB
    >>
  >>
  \layout { }
}
