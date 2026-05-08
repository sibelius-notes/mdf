\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bebop head melody style: chromatic passing tones, off-beat accents, Bb major
\score {
  \new Staff {
    \clef treble \key bes \major \time 4/4 \omit Score.BarNumber
    \once \override Score.RehearsalMark.self-alignment-X = #LEFT
    \mark \markup { \small \italic "Bebop head (Bb major)" }
    \tuplet 3/2 { r8 d'8 ees'8 }
    f'8 ges'8 f'8 ees'8 d'8 |
    ees'8 f'8-> g'8 aes'8 g'8 f'8 ees'8 d'8 |
    \tuplet 3/2 { ees'8 f'8 g'8 }
    aes'4-> bes'8 c''8 bes'8 aes'8 |
    g'8-> f'8 ees'8 d'8 ees'4 bes'4-> |
  }
  \layout { }
}
