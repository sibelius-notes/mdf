\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Cmaj7 voicing: 4 bars of comping context with ascending melody
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c1:maj7 c1:maj7 c1:maj7 c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Melody: E-G-B-D ascending quarter notes, then 2-bar phrase
        e'4 g'4 b'4 d''4 |
        b'2 g'2 |
        e'4 d''4 b'2 |
        g'1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Walking bass with chord tones
        <c e g b>2 <c e g b>2 |
        <c e g b>2 <g b d' f'>2 |
        <c e g b>2 <e g b d'>2 |
        <c e g b>1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
