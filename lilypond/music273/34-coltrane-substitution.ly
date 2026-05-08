\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Coltrane substitution: standard ii-V-I vs Coltrane major-third cycle
% System 1: Dm7-G7-Cmaj7 (4 bars)
% System 2: Coltrane substitute EMaj7-F#7-Abmaj7-A7-Cmaj7 (4 bars)
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        % Standard
        d2:m7 g2:7 c1:maj7
        % Coltrane sub: three major-third key centers
        e2:maj7 fis2:7 aes2:maj7 a2:7 c1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Standard ii-V-I melody
        f'2^\markup { \tiny "standard" } b'2 |
        e'1 |
        % Coltrane sub melody — same resolution E, different approach
        gis'2^\markup { \tiny "Coltrane sub" } ais'2 |
        aes'2 cis''2 |
        c''1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Standard: D-G-C
        d2 g,2 |
        c2 g,2 |
        % Coltrane: E-F#-Ab-A-C (major third cycle)
        e,2 fis,2 |
        aes,2 a,2 |
        c2 g,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
