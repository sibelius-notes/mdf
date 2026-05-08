\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Beethoven, Waldstein Sonata Op. 53/I (Allegro con brio) — opening 4 bars.
% Both hands: repeated pp 8th-note block chords throughout.
% Harmonic plan: I (bars 1-2) → V/V (bar 3, D major) → V (bar 4), cadencing on G major.
% The phrase repeats a tone lower (Bb) in bars 5-8. LH starts on C2 (lowest register).
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \tempo "Allegro con brio"
      \omit Score.BarNumber
      % Bars 1–2: C major — "devoid of melody," pure rhythmic tension
      <c' e' g' c''>8\pp <c' e' g' c''>8 <c' e' g' c''>8 <c' e' g' c''>8
        <c' e' g' c''>8 <c' e' g' c''>8 <c' e' g' c''>8 <c' e' g' c''>8 |
      <c' e' g' c''>8 <c' e' g' c''>8 <c' e' g' c''>8 <c' e' g' c''>8
        <c' e' g' c''>8 <c' e' g' c''>8 <c' e' g' c''>8 <c' e' g' c''>8 |
      % Bar 3: D major (V/V) — secondary dominant preparing G major
      <d' fis' a' d''>8 <d' fis' a' d''>8 <d' fis' a' d''>8 <d' fis' a' d''>8
        <d' fis' a' d''>8 <d' fis' a' d''>8 <d' fis' a' d''>8 <d' fis' a' d''>8 |
      % Bar 4: G major (V) — motif "escapes into treble," 4-note descent
      <d' g' b' d''>8 <d' g' b' d''>8 d''8^\markup { \tiny "V" } c''8 b'8 a'8 g'4 |
      \bar "||"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % LH: c, = C2, g, = G2 (very low register, characteristic of this opening)
      <c, g, c e>8 <c, g, c e>8 <c, g, c e>8 <c, g, c e>8
        <c, g, c e>8 <c, g, c e>8 <c, g, c e>8 <c, g, c e>8 |
      <c, g, c e>8 <c, g, c e>8 <c, g, c e>8 <c, g, c e>8
        <c, g, c e>8 <c, g, c e>8 <c, g, c e>8 <c, g, c e>8 |
      <d, a, d fis>8 <d, a, d fis>8 <d, a, d fis>8 <d, a, d fis>8
        <d, a, d fis>8 <d, a, d fis>8 <d, a, d fis>8 <d, a, d fis>8 |
      <g, d g b>8 <g, d g b>8 <g, d g b>8 <g, d g b>8
        <g, d g b>8 <g, d g b>8 <g, d g b>8 <g, d g b>8 |
      \bar "||"
    }
  >>
  \layout { }
}
