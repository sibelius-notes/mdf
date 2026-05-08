\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \tempo \markup { \italic "Shepard: perpetual ascent illusion" }
    % Bar 1: C pitch class across multiple octaves (inner louder, outer quieter)
    % Notated as octave-spread chord ascending
    <c c' c'' c'''>1^\markup { \tiny "Shepard chord: C (all octaves)" } |
    % Bar 2: ascending chromatic run suggesting perpetual rise
    c'8^\markup { \tiny "ascending..." } cis'8 d'8 dis'8 e'8 f'8 fis'8 g'8 |
    % Bar 3: continues ascending
    gis'8 a'8 bes'8 b'8 c''8 cis''8 d''8 dis''8 |
    % Bar 4: loops back — illusion continues
    <c c' c'' c'''>1_\markup { \tiny "back to C — endless?" } |
  }
  \layout { }
}
