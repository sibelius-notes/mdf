\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Flamenco Sketches: 5 mode vamps (2 bars each) — C Ionian, D Dorian, E Phrygian,
% F Lydian, G Mixolydian — each as independent harmonic region
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c2 c2 c2 c2
        d2:m d2:m d2:m d2:m
        e2:m e2:m e2:m e2:m
        f2:maj7.11+ f2:maj7.11+ f2:maj7.11+ f2:maj7.11+
        g2:7 g2:7 g2:7 g2:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % C Ionian vamp: stable, bright
        e'4^\markup { \tiny "C Ionian" } g'4 b'4 g'4 |
        c''2 g'2 |
        % D Dorian vamp: minor, raised 6th B
        f'4^\markup { \tiny "D Dorian" } a'4 b'4 a'4 |
        d'2 f'2 |
        % E Phrygian vamp: dark, flat 2nd F
        f'4^\markup { \tiny "E Phrygian" } e'4 g'4 f'4 |
        e'2 b4 e'4 |
        % F Lydian vamp: major, raised 4th (B natural)
        a'4^\markup { \tiny "F Lydian" } b'4 c''4 a'4 |
        f'2 a'2 |
        % G Mixolydian vamp: bluesy, flat 7th F
        b'4^\markup { \tiny "G Mixolydian" } d''4 f'4 g'4 |
        g'2 d''2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        c2 g,2 | c2 e2 |
        d2 a,2 | d2 f2 |
        e,2 b,2 | e,2 g,2 |
        f,2 c2 | f,2 a,2 |
        g,2 d2 | g,2 b,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
