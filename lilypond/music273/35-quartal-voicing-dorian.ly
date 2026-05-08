\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Dm7 quartal voicings: D-G-C-F vs G-C-F-Bb, 4 bars showing quartal sound
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d1:m7 d1:m7 d1:m7 d1:m7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Voicing 1: RH quartal stack C-F-A (So What style)
        <c' f' a'>2^\markup { \tiny "C-F-A" } <c' f' a'>2 |
        % Voicing 2: RH quartal a step higher G-C-F
        <g' c'' f''>2^\markup { \tiny "G-C-F" } <g' c'' f''>2 |
        <c' f' a'>2 <g' c'' f''>2 |
        <c' f' a'>1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % LH quartal: A-D-G (So What bass voicing)
        <a, d g>2^\markup { \tiny "A-D-G" } <a, d g>2 |
        % LH quartal inverted: D-G-C
        <d g c'>2^\markup { \tiny "D-G-C" } <d g c'>2 |
        <a, d g>2 <d g c'>2 |
        <a, d g>1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
