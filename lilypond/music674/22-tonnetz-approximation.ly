\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Neo-Riemannian Tonnetz: three-row grid approximation showing fifth/third axes
% Row 1 (fifths): C G D; Row 2 (major thirds): E B F#; Row 3: Ab Eb Bb
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \omit Score.BarNumber
      c'1^\markup { \small "C" }
      g'1^\markup { \small "G (P5↑)" }
      d''1^\markup { \small "D" }
    }
    \new Staff {
      \clef treble \omit Score.BarNumber
      e'1^\markup { \small "E (M3↑)" }
      b'1^\markup { \small "B" }
      fis''1^\markup { \small "F♯" }
    }
    \new Staff {
      \clef treble \omit Score.BarNumber
      aes'1^\markup { \small "A♭ (m3↑)" }
      ees''1^\markup { \small "E♭" }
      bes'1^\markup { \small "B♭" }
    }
  >>
  \layout { }
}
