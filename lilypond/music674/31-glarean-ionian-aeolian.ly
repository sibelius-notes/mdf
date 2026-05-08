\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Glarean's Dodecachordon (1547): adding Ionian and Aeolian to the modal system
% The pedagogical point: both have a strong leading-tone → final relationship
% Treble = C Ionian (C major) cadence B→C; Bass = A Aeolian (A natural minor) G→A
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Ionian: C major scale with B→C leading tone cadence
      c'4^\markup { \small "Ionian (mode 11, Glarean 1547)" }
      d'4 e'4 f'4 |
      g'4 a'4 b'4 c''4 |
      % Cadence: B → C (leading tone, crucial to Ionian's identity)
      b'2^\markup { \small "leading tone B→C" } c''2 \bar "||"
    }
    \new Staff {
      \clef treble \key a \minor \time 4/4
      \omit Score.BarNumber
      % Aeolian: A natural minor with G→A (subtonic, not true leading tone)
      a4^\markup { \small "Aeolian (mode 9, Glarean 1547)" }
      b4 c'4 d'4 |
      e'4 f'4 g'4 a'4 |
      % Cadence: G → A (subtonic, weaker than B→C of Ionian)
      g'2^\markup { \small "subtonic G→A (weaker)" } a'2 \bar "|."
    }
  >>
  \layout { }
}
