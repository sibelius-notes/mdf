\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Chromatic mediant cycle: Cmaj7-Abmaj7-Emaj7 (major-third cycle) + connecting melody
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c1:maj7 aes1:maj7 e1:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Melody connects chromatic mediants: common tones and smooth motion
        % Cmaj7: C-E-G-B
        g'4^\markup { \tiny "Cmaj7" } b'4 e''2 |
        % Abmaj7: Ab-C-Eb-G — note b->ab and e->ees (chromatic drop)
        aes'4^\markup { \tiny "A♭maj7 (M3↓)" } c''4 ees''2 |
        % Emaj7: E-G#-B-D# — another M3 down
        e'4^\markup { \tiny "Emaj7 (M3↓)" } gis'4 b'4 dis''4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        c2_\markup { \tiny "C" } g,2 |
        aes,2_\markup { \tiny "A♭ (M3 below)" } ees2 |
        e,2_\markup { \tiny "E (M3 below)" } b,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
