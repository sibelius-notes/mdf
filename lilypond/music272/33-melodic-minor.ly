\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Two-voice tonal counterpoint in A minor demonstrating melodic minor inflection.
% Soprano ascends through raised ^6 (F#) and ^7 (G#) toward tonic;
% descends using natural forms (F, G) to avoid the augmented second.
% Bass = cantus firmus in whole notes.
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \minor \time 4/4
      \omit Score.BarNumber
      \relative c'' {
        e'4^\markup { \tiny "↑ raised \hat{6}, \hat{7}" }
        fis'4 gis'4 a'4 |
        a'4^\markup { \tiny "↓ natural \hat{7}, \hat{6}" }
        g'4 f'4 e'4 |
        d'2 e'2^\markup { \tiny "HC" }
        \bar "||"
        e'4 d'4 c'4 b4 |
        a1^\markup { \tiny "PAC" }
        \bar "|."
      }
    }
    \new Staff {
      \clef bass \key a \minor \time 4/4
      \omit Score.BarNumber
      \relative c {
        a,1 |
        a,1 |
        e,1 |
        a,1 |
      }
    }
  >>
  \layout { }
}
