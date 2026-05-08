\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Homorhythmic chanson style: 4-voice block chords, homophonic texture (Sermisy/Janequin style)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key g \major
      \time 4/4
      \omit Score.BarNumber
      <<
        { ^ \markup { \italic "superius" }
          d''4 d''4 e''4 d''4 | c''2 b'2 | a'4 b'4 c''4 d''4 | g'1 | }
        \\
        { _ \markup { \italic "altus" }
          b'4 b'4 c''4 b'4 | a'2 g'2 | f'4 g'4 a'4 b'4 | d'1 | }
      >>
    }
    \new Staff {
      \clef bass
      \key g \major
      \time 4/4
      <<
        { ^ \markup { \italic "tenor" }
          g'4 g'4 g'4 g'4 | e'2 d'2 | d'4 d'4 e'4 f'4 | b1 | }
        \\
        { _ \markup { \italic "bassus" }
          g4 g4 c4 g4 | a2 g2 | d4 g4 c4 g,4 | g1 | }
      >>
    }
  >>
  \layout { }
}
