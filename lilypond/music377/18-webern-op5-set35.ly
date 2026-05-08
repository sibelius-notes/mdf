\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Webern Op.5 No.4: {0,1,6} = [3-5] (016) — the "split" trichord
% Sparse Webern style: staccato figures in treble, sustained bass, prominent rests
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c''' {
        \time 4/4
        % Bar 1: C-Db-Gb gesture {0,1,6}  [3-5]
        c'4.^\markup { \tiny "[3-5] {0,1,6}" }\staccato
        r8 r4
        des'4\staccato
        |
        % Bar 2: rest — Webern silence
        fis'4\staccato r4 r2
        |
        % Bar 3: T₁ version: Db-D-G {1,2,7}
        des'4^\markup { \tiny "T₁{1,2,7}" }\staccato
        r4
        d'4\staccato g'4\staccato
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 4/4
        % Sustained legato counterpoint — sparse
        c2~\pp
        c4 r4
        |
        r1
        |
        fis2~\p
        fis4 r4
      }
    }
  >>
  \layout { }
}
