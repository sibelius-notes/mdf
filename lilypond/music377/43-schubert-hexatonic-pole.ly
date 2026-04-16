\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Schubert hexatonic pole: E major {4,8,11} and F minor {5,8,0}
  % Voice-leading: E->F (semitone), G#->Ab (enharmonic), B->C (semitone)
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % E major -> F minor voice leading
      e'2^\markup { \tiny "E" }
      f'2^\markup { \tiny "→F" }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        <gis' b'>2^\markup { \tiny "G♯ B" }
        <aes' c''>2^\markup { \tiny "→A♭ C" }
      }
    }
  >>
  \layout { }
}
