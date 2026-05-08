\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Anacrusis (pickup) comparison: WITHOUT pickup (bars 1-2) vs WITH pickup (bars 3-4)
% The pickup notes create forward momentum into the downbeat

\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \relative c'' {
      % Without pickup: melody starts on the downbeat (flat, heavy landing)
      \mark \markup { \italic "without pickup" }
      c4 d e f |
      g2 e2 |
      % With pickup: three 8th-note anacrusis before bar 3's downbeat
      \mark \markup { \italic "with pickup" }
      \partial 4 g,8 a8 |
      b4 c d e |
      g2 e2 \bar "|."
    }
  }
  \layout { }
}
