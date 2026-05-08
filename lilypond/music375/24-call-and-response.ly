\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Call and response: 2-bar call (ends on V, open), 2-bar response (resolves to I)
% GrandStaff: both phrases on single staff with labels; bass below

chordsCAR = \chordmode {
  g1 | g1 | c1 | c1 |
}

% Single melody staff — call in bars 1-2, response in bars 3-4
melodyCR = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Call: ascends, ends on D (^5 of G = dominant, open feeling)
  \mark \markup { \bold "Call" }
  g4 a b c |
  d2 r2 |
  % Response: answers with descent to tonic C
  \mark \markup { \bold "Response" }
  e4 d c b |
  c1 \bar "|."
}

bassCR = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  g4 b d2 |
  g,4 b d2 |
  c4 e g2 |
  c,4 e g2 |
}

\score {
  <<
    \new ChordNames { \chordsCAR }
    \new GrandStaff <<
      \new Staff { \melodyCR }
      \new Staff { \bassCR }
    >>
  >>
  \layout { }
}
