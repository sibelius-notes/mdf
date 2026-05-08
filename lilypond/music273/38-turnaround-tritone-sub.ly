\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Standard vs tritone-sub turnaround compared on two consecutive systems.
% Chromatic bass descent C–E♭–D–D♭ in the substituted version.
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        % Standard turnaround
        c2:maj7 a2:7 d2:m7 g2:7
        % Tritone-sub turnaround
        c2:maj7 ees2:7 d2:m7 des2:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Guide-tone melody shared (same resolution target; tritone subs preserve guide tones)
        b4^\markup { \tiny "std" } cis'4 c'4 b4 |
        b4^\markup { \tiny "sub" } ges'4 f'4 ces'4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Standard: C–A–D–G (cycle-of-fifths motion)
        c4_\markup { \tiny "↓5ths" } a,4 d4 g,4 |
        % Tritone sub: C–E♭–D–D♭ (chromatic descent)
        c4_\markup { \tiny "↓chromatic" } ees4 d4 des4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
