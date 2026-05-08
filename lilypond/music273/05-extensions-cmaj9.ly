\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Cmaj9 → Cmaj11(#11) → Cmaj13 extension expansion on GrandStaff
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c2.:maj9 c2.:maj9 c2.:maj7.11+ c2.:maj7.11+ c2.:maj13 c2.:maj13
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 3/4
        \omit Score.BarNumber
        % Cmaj9: add 9th (D)
        <e g b d'>2.^\markup { \tiny "Cmaj9: add 9th" } |
        <e g b d'>2. |
        % Cmaj7(#11): raised 11th (F#) instead of natural 4th
        <e g b fis'>2.^\markup { \tiny "Cmaj7(♯11): raise 4th" } |
        <e g b fis'>2. |
        % Cmaj13: add 13th (A)
        <e b d' a'>2.^\markup { \tiny "Cmaj13: add 13th" } |
        <e b d' a'>2. |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 3/4
        \omit Score.BarNumber
        c2._\markup { \tiny "I" } |
        c2. |
        c2._\markup { \tiny "I(♯11)" } |
        c2. |
        c2._\markup { \tiny "I13" } |
        c2. |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
