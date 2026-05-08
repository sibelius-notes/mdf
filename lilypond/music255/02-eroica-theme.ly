\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Beethoven Op.55 Eroica — 1st movement P-theme, Eb major
\score {
  \new Staff {
    \clef treble
    \key es \major
    \time 3/4
    \tempo "Allegro con brio"
    \omit Score.BarNumber
    \relative c'' {
      % bar 1 — heroic Eb fanfare opening
      es4\f g8 es g4 |
      % bar 2 — rising continuation
      bes4 es,2 |
      % bar 3 — ascending heroic line
      g4 as g |
      % bar 4 — step motion upward
      f4 es f |
      % bar 5 — peak and descent
      g4 as bes |
      % bar 6 — coming back with energy
      c4 bes as |
      % bar 7 — harmonic confirmation
      g4 f es |
      % bar 8 — cadential close
      <es g bes>2.\p |
    }
  }
  \layout { }
}
