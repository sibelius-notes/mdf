\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Finale ensemble: 3-voice imitative entry (soprano/mezzo/tenor staggered at 2-bar intervals)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      \omit Score.BarNumber
      <<
        { ^ \markup { \italic "soprano" }
          c''2 d''4 e''4 | f''2 e''4 d''4 |
          c''2 d''4 e''4 | f''1 | }
        \\
        { _ \markup { \italic "mezzo" }
          r1 | c'2 d'4 e'4 |
          f'2 e'4 d'4 | c'2 d'4 e'4 | }
      >>
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      _ \markup { \italic "tenor (continuo doubles)" }
      r1 | r1 | c2 d4 e4 | f2 e4 d4 |
    }
  >>
  \layout { }
}
