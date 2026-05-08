\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Shell voicings: ii-V-I-I (Dm7-G7-Cmaj7-Cmaj7) with bass roots half-note rhythm
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d2:m7 g2:7 c2:maj7 c2:maj7 d2:m7 g2:7 c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Shell voicings: root+3rd+7th, no 5th
        % Dm7 shell: D F C; G7 shell: G B F; Cmaj7 shell: C E B
        <d f c'>2^\markup { \tiny "Dm7 shell" } <g b f'>2^\markup { \tiny "G7 shell" } |
        <c e b>2^\markup { \tiny "Cmaj7 shell" } <c e b>2 |
        <d f c'>2 <g b f'>2 |
        <c e b>1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        d2 g,2 |
        c2 g,2 |
        d2 g,2 |
        c1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
