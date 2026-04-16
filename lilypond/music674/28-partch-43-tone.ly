\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Partch 43-tone scale approximated as chromatic run with microtonal annotation
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    c'8^\markup { \small "43-tone (approx.)" }
    cis'8 des'8 d'8 dis'8 ees'8 e'8 f'8
    fis'8 g'8 gis'8 aes'8 a'8 ais'8 bes'8 b'8
    c''1_\markup { \small "43 pitches/octave (Partch, 1949)" }
  }
  \layout { }
}
