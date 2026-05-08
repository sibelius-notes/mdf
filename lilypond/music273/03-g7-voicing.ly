\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G7 voicing: 4 bars of comping with tritone B-F emphasis in melody
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        g1:7 g1:7 g1:7 g1:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Melody emphasizes tritone B (3rd) and F (7th)
        b'4 d''4 f'2 |
        b'2 f'4 g'4 |
        d''4 b'4 f'4 d'4 |
        b2 r2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        <g b d' f'>2 <g b d' f'>2 |
        <g b d' f'>2 <d, f, a, c>2 |
        <g b d' f'>2 <b, d f a>2 |
        <g b d' f'>1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
