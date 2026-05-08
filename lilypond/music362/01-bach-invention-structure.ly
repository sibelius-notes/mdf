\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bach Two-Part Invention: subject and countersubject in invertible counterpoint
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bars 1-2: subject in treble
      c'16\mf d'16 e'16 f'16 g'16 a'16 g'16 f'16 e'16 d'16 c'8 r8 |
      % Bar 2: subject continues, countersubject enters below
      e'16 f'16 g'16 a'16 b'16 c''16 b'16 a'16 g'16 f'16 e'8 r8 |
      % Bar 3: treble has countersubject
      c''8 b'8 a'8 g'8 f'8 e'8 d'8 c'8 |
      % Bar 4: resolution
      g'4 e'4 c'2 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Bars 1: bass rests while treble has subject
      r1 |
      % Bar 2: countersubject enters in bass
      c16 d16 e16 f16 g16 a16 g16 f16 e16 d16 c8 r8 |
      % Bar 3: bass has subject (imitation)
      e16 f16 g16 a16 b16 c'16 b16 a16 g16 f16 e8 r8 |
      % Bar 4: resolution in bass
      c4 g,4 c,2 \bar "|."
    }
  >>
  \layout { }
}
