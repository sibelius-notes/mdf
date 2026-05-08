\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Compare I-vi-ii-V vs I-bVI7-ii-bII7 (tritone sub turnaround): chromatic bass
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        % Standard turnaround
        c2:maj7 a2:7 d2:m7 g2:7
        % Tritone sub turnaround
        c2:maj7 ees2:7 d2:m7 des2:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Melody same both times (guide tones preserved)
        e'4^\markup { \tiny "standard" } cis'4 d'4 b4 |
        e'4^\markup { \tiny "tritone sub" } ges'4 f'4 ces'4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Standard: C-A-D-G
        c2_\markup { \tiny "C–A–D–G" } a,2 |
        % Tritone sub: C-Eb-D-Db chromatic descent
        c2_\markup { \tiny "C–E♭–D–D♭" } ees2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
