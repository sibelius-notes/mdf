\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Compare: Dm7-G7-Cmaj7 vs Dm7-Db7-Cmaj7 (tritone sub): chromatic bass D→Db→C
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        % System 1: standard ii-V-I
        d2:m7 g2:7 c1:maj7
        % System 2: tritone sub
        d2:m7 des2:7 c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Standard ii-V-I melody
        f'2^\markup { \tiny "standard" } b'2 |
        e'1 |
        % Tritone sub: guide tones preserved (B=Cb, F same)
        f'2^\markup { \tiny "tritone sub" } b'2 |
        e'1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Standard: D-G-C
        d2_\markup { \tiny "D→G→C" } g,2 |
        c2 g,2 |
        % Tritone sub: D-Db-C chromatic descent
        d2_\markup { \tiny "D→D♭→C" } des2 |
        c2 g,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
