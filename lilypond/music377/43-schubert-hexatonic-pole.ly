\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schubert hexatonic pole: E major → F minor (max-voice-leading distance)
% Added: cantabile melodic line on top connecting the two poles
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c''' {
        \time 3/4
        % E major: cantabile melody begins on B
        b'4.^\markup { \tiny "E major" }
        b'8~ b'4
        |
        % Voice leading to F minor pole: B→C (semitone), G#→Ab, E→F
        c''4.^\markup { \tiny "→F minor" }
        c''8~ c''4
        |
        % Return gesture: F minor back to E major
        b'2^\markup { \tiny "hexatonic pole" }
        r4
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % E major full chord
        <e' gis' b'>2.^\markup { \tiny "{4,8,11}" }
        |
        % F minor: {5,8,0} = F Ab C — hexatonic pole
        <f' aes' c''>2.^\markup { \tiny "{5,8,0}" }
        |
        <e' gis' b'>2 r4
      }
    }
  >>
  \layout { }
}
