\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

chordsHook = \chordmode {
  c1 | g1 | a1:m | f1 |
}

% Melodic hook: ascending leap then stepwise descent — 4 bars over I-V-vi-IV
melodyHook = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g4 c8 b a4 g |
  f4 e d c8 d |
  e4 a8 g~ g4 f8 e |
  f4 e d2 \bar "|."
}

bassHook = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g2 |
  g,4 b d2 |
  a4 c e2 |
  f4 a c2 |
}

\score {
  <<
    \new ChordNames { \chordsHook }
    \new GrandStaff <<
      \new Staff { \melodyHook }
      \new Staff { \bassHook }
    >>
  >>
  \layout { }
}
