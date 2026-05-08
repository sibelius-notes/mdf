\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Directed vs undirected intervals as two-voice counterpoint
% Treble = ascending (directed +), Bass = same intervals descending (directed -)
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % Bar 1: m2 ascending directed int = +1
        c'4^\markup { \tiny "i(0→1)=+1" } des'4 r4
        |
        % Bar 2: M3 ascending directed int = +4
        c'4^\markup { \tiny "i(0→4)=+4" } e'4 r4
        |
        % Bar 3: P4 ascending directed int = +5
        c'4^\markup { \tiny "i(0→5)=+5" } f'4 r4
        |
        % Bar 4: tritone directed int = +6 / -6 (same)
        c'4^\markup { \tiny "i(0→6)=+6" } fis'4 r4
        |
        % Bar 5: P5 ascending directed int = +7
        c'4^\markup { \tiny "i(0→7)=+7" } g'4 r4
        |
        % Bar 6: M6 ascending directed int = +9
        c'4^\markup { \tiny "i(0→9)=+9" } a'4 r4
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        \time 3/4
        % Same intervals descending: directed = negative
        c'4^\markup { \tiny "i(0→11)=−1" } b4 r4
        |
        c'4^\markup { \tiny "i(0→8)=−4" } aes4 r4
        |
        c'4^\markup { \tiny "i(0→7)=−5" } g4 r4
        |
        c'4^\markup { \tiny "i(0→6)=−6" } fis4 r4
        |
        c'4^\markup { \tiny "i(0→5)=−7" } f4 r4
        |
        c'4^\markup { \tiny "i(0→3)=−9" } ees4 r4
      }
    }
  >>
  \layout { }
}
