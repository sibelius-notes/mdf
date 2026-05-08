\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Eight-mode system: each mode shown as a 2-voice phrase (tenor + bass root)
% Tenor = characteristic ambitus; Bass = final pitch
% Authentic (I III V VII) and Plagal (II IV VI VIII) pairs for each final
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \omit Score.BarNumber
      \omit Score.TimeSignature
      \cadenzaOn
      % Mode I (Protus auth.) — D final, ambitus d-d'
      d'4^\markup { \small "I: D auth." } f'4 a'4 d''4 \bar "||"
      % Mode II (Protus plag.) — D final, ambitus A-a
      a4^\markup { \small "II: D plag." } c'4 e'4 d'4 \bar "||"
      % Mode III (Deuterus auth.) — E final, ambitus e-e'
      e'4^\markup { \small "III: E auth." } g'4 b'4 e''4 \bar "||"
      % Mode IV (Deuterus plag.) — E final, ambitus B-b
      b4^\markup { \small "IV: E plag." } d'4 f'4 e'4 \bar "||"
      % Mode V (Tritus auth.) — F final, ambitus f-f'
      f'4^\markup { \small "V: F auth." } a'4 c''4 f''4 \bar "||"
      % Mode VI (Tritus plag.) — F final, ambitus C-c'
      c'4^\markup { \small "VI: F plag." } e'4 g'4 f'4 \bar "||"
      % Mode VII (Tetrardus auth.) — G final, ambitus g-g'
      g'4^\markup { \small "VII: G auth." } b'4 d''4 g''4 \bar "||"
      % Mode VIII (Tetrardus plag.) — G final, ambitus D-d'
      d'4^\markup { \small "VIII: G plag." } f'4 a'4 g'4 \bar "|."
    }
    \new Staff {
      \clef bass
      \omit Score.BarNumber
      \omit Score.TimeSignature
      \cadenzaOn
      d4 d4 d4 d4 \bar "||"
      d4 d4 d4 d4 \bar "||"
      e4 e4 e4 e4 \bar "||"
      e4 e4 e4 e4 \bar "||"
      f4 f4 f4 f4 \bar "||"
      f4 f4 f4 f4 \bar "||"
      g,4 g,4 g,4 g,4 \bar "||"
      g,4 g,4 g,4 g,4 \bar "|."
    }
  >>
  \layout { }
}
