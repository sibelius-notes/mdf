\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Fugue subject and answer"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key a \minor
      \time 4/4
      ^ \markup { \italic "subject (soprano)" }
      % Bar 1: subject in soprano
      a'8 b'8 c''8 d''8 e''8 f''8 e''8 d''8 |
      % Bar 2: countersubject while answer in bass
      c''8 d''8 e''8 f''8 e''8 d''8 c''8 b'8 |
      % Bars 3-4: countersubject continues
      a'8 g'8 f'8 e'8 d'8 e'8 f'8 g'8 |
      a'2 r2 |
    }
    \new Staff {
      \clef bass
      \key a \minor
      \time 4/4
      _ \markup { \italic "answer (bass, fifth below)" }
      % Bar 1: silent
      r1 |
      % Bar 2: answer enters a fifth below (tonal answer)
      d8 e8 f8 g8 a8 bes8 a8 g8 |
      f8 g8 a8 bes8 a8 g8 f8 e8 |
      d2 r2 |
    }
  >>
  \layout { }
}
