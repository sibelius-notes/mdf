\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Corelli-style trio sonata: two treble voices (Vln I + II) above basso continuo with suspensions
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key g \major
      \time 4/4
      \omit Score.BarNumber
      <<
        { ^ \markup { \italic "Violino I" }
          d''4 e''4 d''4 c''4 | b'4 c''4 b'4 a'4 | g'2 fis'4 g'4 | d'1 | }
        \\
        { _ \markup { \italic "Violino II" }
          b'4 c''4 b'4 a'4 | g'4 a'4 g'4 fis'4 | e'2 d'4 e'4 | d'1 | }
      >>
    }
    \new Staff {
      \clef bass
      \key g \major
      \time 4/4
      _ \markup { \italic "Basso continuo" }
      g4 a4 g4 fis4 | e4 fis4 g4 d4 | c4 a,4 d4 b,4 | g,1 |
    }
  >>
  \layout { }
}
