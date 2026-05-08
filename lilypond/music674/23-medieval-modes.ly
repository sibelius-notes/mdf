\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Medieval eight-mode system: authentic (odd) and plagal (even) pairs
% Top staff = authentic modes (I, III, V, VII); Bottom = plagal (II, IV, VI, VIII)
% Each mode = 1 bar of whole notes; final marked with tenuto
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \omit Score.BarNumber
      \omit Score.TimeSignature
      \cadenzaOn
      % Mode I: Protus authenticus — D to d
      d'1^\markup { \small "I Protus auth." } e'1 f'1 g'1 a'1 b'1 c''1 d''1-. \bar "||"
      % Mode III: Deuterus authenticus — E to e
      e'1^\markup { \small "III Deuterus auth." } f'1 g'1 a'1 b'1 c''1 d''1 e''1-. \bar "||"
      % Mode V: Tritus authenticus — F to f
      f'1^\markup { \small "V Tritus auth." } g'1 a'1 bes'1 c''1 d''1 e''1 f''1-. \bar "||"
      % Mode VII: Tetrardus authenticus — G to g
      g'1^\markup { \small "VII Tetrardus auth." } a'1 b'1 c''1 d''1 e''1 f''1 g''1-. \bar "|."
    }
    \new Staff {
      \clef treble
      \omit Score.BarNumber
      \omit Score.TimeSignature
      \cadenzaOn
      % Mode II: Protus plagalis — A to a (d final)
      a1^\markup { \small "II Protus plag." } b1 c'1 d'1-. e'1 f'1 g'1 a'1 \bar "||"
      % Mode IV: Deuterus plagalis — B to b (e final)
      b1^\markup { \small "IV Deuterus plag." } c'1 d'1 e'1-. f'1 g'1 a'1 b'1 \bar "||"
      % Mode VI: Tritus plagalis — C to c (f final)
      c'1^\markup { \small "VI Tritus plag." } d'1 e'1 f'1-. g'1 a'1 bes'1 c''1 \bar "||"
      % Mode VIII: Tetrardus plagalis — D to d (g final)
      d'1^\markup { \small "VIII Tetrardus plag." } e'1 f'1 g'1-. a'1 b'1 c''1 d''1 \bar "|."
    }
  >>
  \layout { }
}
