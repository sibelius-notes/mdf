\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Upper structure triad on G7: D major triad (upper) over G7 shell (lower)
% D major triad: D F# A — adds 9th and 13th over G7
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % D major triad = upper structure (9th, #11 omitted, 13th)
      <d' fis' a'>1
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % G7 shell: G B F
      <g, b, f>1
    }
  >>
  \layout { }
}
