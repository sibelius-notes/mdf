\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% So What style vamp: 4 bars D Dorian (A) + 4 bars Eb Dorian (B), modal melody
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d1:m7 d1:m7 d1:m7 d1:m7
        ees1:m7 ees1:m7 ees1:m7 ees1:m7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % D Dorian melody (A section): explore raised 6th (B natural)
        d'8 f'8 g'4 a'4 b'8 a'8 |
        g'4 f'4 d'4 e'4 |
        f'8 g'8 a'8 b'8 c''4 a'4 |
        d'2. r4 |
        % Eb Dorian melody (B section — half step up): same shape
        ees'8 ges'8 aes'4 bes'4 c''8 bes'8 |
        aes'4 ges'4 ees'4 f'4 |
        ges'8 aes'8 bes'8 c''8 des''4 bes'4 |
        ees'2. r4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % D Dorian bass: So What quartal comping
        <a, d g>2 <d g c'>2 |
        <a, d g>2 <d g c'>2 |
        <a, d g>2 <d g c'>2 |
        <a, d g>1 |
        % Eb Dorian bass: half step up
        <bes, ees aes>2 <ees aes des'>2 |
        <bes, ees aes>2 <ees aes des'>2 |
        <bes, ees aes>2 <ees aes des'>2 |
        <bes, ees aes>1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
