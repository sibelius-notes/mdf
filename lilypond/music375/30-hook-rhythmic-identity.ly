\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Rhythmic identity: same pitches, two rhythmic treatments
% Bars 1-2: straight 8ths (flat, uniform)
% Bars 3-4: syncopated / pushed version (rhythmically alive)

\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \relative c'' {
      % Straight 8ths
      \mark \markup { \italic "straight" }
      g8 g c c b8 b a a |
      g8 g f f e4 r |
      % Syncopated: same notes, pushed off the beat
      \mark \markup { \italic "swung/syncopated" }
      r8 g4. c4 b8 a~ |
      a8 g4. f8 e4 r8 \bar "|."
    }
  }
  \layout { }
}
