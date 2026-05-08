\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Mozart, Symphony No. 40 in G minor, K. 550 — opening P-theme
% Antecedent (bars 1-2) + Consequent (bars 3-4); G minor, violin melody
upper = \relative c'' {
  \clef treble
  \key g \minor
  \time 4/4
  \omit Score.BarNumber
  % Antecedent phrase — descends from Bb, rises at end
  bes4\p a4 g4 a4 |
  bes4 r4 r2 |
  % Consequent — same motif, redirected to cadence
  bes4 a4 g4 a4 |
  bes4 r4 r2 |
}
lower = \relative c' {
  \clef bass
  \key g \minor
  \time 4/4
  \omit Score.BarNumber
  % Viola-style accompaniment — detached quarter note chords on beats 2 and 3
  r4 <d g bes>4\p r4 <d g bes>4 |
  r4 <d g bes>4 r4 <d g bes>4 |
  r4 <d fis c'>4 r4 <d fis c'>4 |
  r4 <d g bes>4 r4 <d g bes>4 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
