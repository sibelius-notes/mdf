\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Pop metric anticipation: chord/melody hits 8th note BEFORE the downbeat
% The "and of 4" push is the defining rhythmic gesture of modern pop/R&B

chordsAntic = \chordmode {
  c1 | g1 | a1:m | f1 |
}

% Melody anticipates each new chord by an 8th note (tied over barline)
melodyAntic = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Bar 1: hits G on beat 1, then anticipates next bar by 8th
  g4 f e d8. c16~ |
  % Bar 2: c arrives 8th before bar, tied from anticipation
  c4 b a g8. f16~ |
  % Bar 3: continued anticipation
  f4 e8 f~ f4 a8. g16~ |
  g4 f e2 \bar "|."
}

% Bass: chord comping, occasionally also anticipates
bassAntic = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g r8 g8~ |
  g4 b d r8 d8~ |
  d4 c e r8 e8~ |
  e4 a, c2 |
}

\score {
  <<
    \new ChordNames { \chordsAntic }
    \new GrandStaff <<
      \new Staff { \melodyAntic }
      \new Staff { \bassAntic }
    >>
  >>
  \layout { }
}
