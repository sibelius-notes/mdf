\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% 12-bar minor blues in C minor: Cm7-Fm7-Dm7b5-G7b9 + original melody + bass
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c1:m7 c1:m7 c1:m7 c1:m7
        f1:m7 f1:m7
        c1:m7 c1:m7
        d1:m7.5- g1:7.9-
        c1:m7 g1:7.9-
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \minor \time 4/4
        \omit Score.BarNumber
        % Bars 1-4: Cm7 tonic
        ees'4 g'4 bes'4 c''4 |
        bes'8 g'8 ees'8 c'8 ees'4 r4 |
        g'4 bes'8 c''8 ees''4 des''4 |
        c''2. r4 |
        % Bars 5-6: Fm7 subdominant
        aes'4 bes'4 c''2 |
        ges'4 aes'4 bes'2 |
        % Bars 7-8: Cm7 return
        ees'4 g'4 bes'4 c''4 |
        c''2 bes'4 g'4 |
        % Bars 9-10: minor ii-V
        a'4 c''4 ees''4 fis'4 |
        g'4 b'4 d''4 f''4 |
        % Bars 11-12: tonic + turnaround
        ees''4 c''8 bes'8 g'4 ees'4 |
        d'4 aes4 b4 d'4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \minor \time 4/4
        \omit Score.BarNumber
        c2 ees2 | c2 g,2 |
        c2 bes,2 | c2 g,2 |
        f,2 aes,2 | f,2 c2 |
        c2 g,2 | c2 bes,2 |
        d2 aes,2 | g,2 d2 |
        c2 g,2 | c2 g,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
