\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Trichordal saturation: every 3-note grouping = [3-3] (014)
% Treble = principal melody; Bass = accompanying [3-3] harmonies
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c''' {
        \time 4/4
        % Bar 1: [3-3] {7,8,11} = G G# B
        g'8^\markup { \tiny "[3-3]" }
        gis'8 b'4 r4 r4
        |
        % Bar 2: [3-3] {3,4,7} = Eb E G  T₃(014)
        ees'8^\markup { \tiny "T₃" }
        e'8 g'4 r4 r4
        |
        % Bar 3: [3-3] {9,10,1} = A Bb Db  T₉(014)
        a'8^\markup { \tiny "T₉" }
        bes'8 des''4 r4 r4
        |
        % Bar 4: [3-3] {0,1,4} = C Db E  T₀(014)
        c'8^\markup { \tiny "T₀" }
        des'8 e'4 r4 r4
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 4/4
        % Bass: [3-3] chords in harmonic rhythm
        <g, gis, b,>2^\markup { \tiny "[3-3]" }
        r2
        |
        <ees, e, g,>2^\markup { \tiny "T₃(014)" }
        r2
        |
        <a, bes, des>2^\markup { \tiny "T₉(014)" }
        r2
        |
        <c, des, e,>2^\markup { \tiny "T₀(014)" }
        r2
      }
    }
  >>
  \layout { }
}
