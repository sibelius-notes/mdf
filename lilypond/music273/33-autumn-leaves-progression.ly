\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Autumn Leaves A section: original pedagogical 8-bar melody in G minor
% Changes: Cm7-F7-Bbmaj7-Ebmaj7 / Am7b5-D7-Gm
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c1:m7 f1:7 bes1:maj7 ees1:maj7
        a1:m7.5- d1:7 g1:m g1:m
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key bes \major \time 4/4
        \omit Score.BarNumber
        % Original lyrical melody illustrating Bb major → G minor ambiguity
        % Bar 1: Cm7
        ees'4 f'4 g'2 |
        % Bar 2: F7
        a'4 bes'4 c''2 |
        % Bar 3: Bbmaj7 — land on root, major key feel
        d''2. bes'4 |
        % Bar 4: Ebmaj7 — pivot chord
        g'2 ees'2 |
        % Bar 5: Am7b5 — dark, half-dim color
        a'4 c''4 ees''4 g'4 |
        % Bar 6: D7 — leading tone C# resolves to D then G
        fis'4 a'4 c''4 ees''4 |
        % Bar 7: Gm resolution
        d''2. bes'4 |
        % Bar 8: Gm cadence
        g'1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key bes \major \time 4/4
        \omit Score.BarNumber
        % Sustained roots
        c2 ees2 |
        f,2 c2 |
        bes,2 f,2 |
        ees2 bes,2 |
        a,2 ees2 |
        d2 a,2 |
        g,2 d2 |
        g,1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
