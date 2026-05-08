\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Antecedent-Consequent phrase pair
% Antecedent (bars 1-2): ends on HC (half cadence, V)
% Consequent (bars 3-4): ends on PAC (perfect authentic cadence, V-I)

chordsQA = \chordmode {
  c1 | g1 | c1 | g1 |
}

melodyQA = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Antecedent — ends on D (scale degree 2, open/questioning)
  \mark \markup { \italic "Antecedent (HC)" }
  e4 d c b |
  a4 b c d |
  % Consequent — same opening, now resolves to C
  \mark \markup { \italic "Consequent (PAC)" }
  e4 d c b |
  g4 a b c \bar "|."
}

bassQA = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g2 |
  g,4 b d2 |
  c4 e g2 |
  g,4 b d c \bar "|."
}

\score {
  <<
    \new ChordNames { \chordsQA }
    \new GrandStaff <<
      \new Staff { \melodyQA }
      \new Staff { \bassQA }
    >>
  >>
  \layout { }
}
