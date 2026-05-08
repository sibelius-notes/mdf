\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Standard I-vi-ii-V turnaround in C: guide-tone voice leading + walking bass.
% Guide tones resolve 7th→3rd, 3rd→7th through the cycle.
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c2:maj7 a2:7 d2:m7 g2:7 c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Guide-tone line: B(7th Cmaj7) → C#(3rd A7) → C(7th Dm7) → B(3rd G7) → B(7th Cmaj7)
        b4^\markup { \tiny "7" } cis'4^\markup { \tiny "3" } c'4^\markup { \tiny "7" } b4^\markup { \tiny "3" } |
        b1^\markup { \tiny "7" } |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Walking bass: roots + approach
        c4 e4 a,4 cis4 |
        d4 f4 g,4 b,4 |
        c2. r4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
