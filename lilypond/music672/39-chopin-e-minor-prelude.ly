\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 7.2 — Chopin Prelude Op. 28 No. 4: fifth-line Urlinie in E minor
% 5̂(B)–4̂(A)–3̂(G)–2̂(F#)–1̂(E) over bass I–V–I
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key e \minor \time 4/4 \omit Score.BarNumber
      b'1^"5̂"
      b'1^"5̂ prolonged"
      a'1^"4̂"
      g'1^"3̂"
      fis'1^"2̂"
      e'1^"1̂"
    }
    \new Staff {
      \clef bass \key e \minor \time 4/4 \omit Score.BarNumber
      e,1_"I"
      e,1_"I"
      e,1_"I (bass desc.)"
      e,1
      b,,1_"V"
      e,1_"I"
    }
  >>
  \layout { }
}
