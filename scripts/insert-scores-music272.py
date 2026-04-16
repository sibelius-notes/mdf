#!/usr/bin/env python3
"""Insert {{< score >}} shortcodes into music272.md at all anchor points."""
import re

FILEPATH = "content/1269/music272.md"

# Each tuple: (search_snippet, score_id(s), caption(s))
# The search snippet must be unique in the file.
# We insert after the line containing the snippet.
INSERTIONS = [
    # Ch 1 – Definitions / Theorems / Examples
    (
        "All other diatonic intervals — seconds, sevenths, the tritone — are classified as <em>dissonances</em>.",
        [
            ("music272/01-perfect-consonances", "The four perfect consonances: unison (1:1), perfect fourth (4:3), perfect fifth (3:2), and octave (2:1)."),
            ("music272/02-imperfect-consonances", "The four imperfect consonances: major third (5:4), minor third (6:5), major sixth (5:3), minor sixth (8:5)."),
        ]
    ),
    (
        "Dissonances require preparation or special treatment, and in all standard cases resolve by stepwise motion to a consonance.",
        [
            ("music272/03-dissonances", "Representative dissonances: minor second, major seventh, and tritone (augmented fourth)."),
        ]
    ),
    (
        "The consonance of an interval is thus directly proportional to the proximity of its constituent partials in the harmonic series",
        [
            ("music272/04-harmonic-series", "The first six partials of the harmonic series on C, yielding the ratios 1:1, 2:1, 3:2, 4:3, 5:4, 6:5."),
        ]
    ),
    (
        "Dissonances may appear on weak beats, but only under specific conditions that guarantee their perceptual resolution.",
        [
            ("music272/05-consonance-principle", "Strong-beat consonances (marked) versus weak-beat passing dissonances in a two-voice texture."),
        ]
    ),
    (
        "<li><em>Parallel motion</em>: \\(\\delta_1 = \\delta_2 \\neq 0\\) — voices move in the same direction by the same interval, preserving the intervallic distance between them exactly.</li>",
        [
            ("music272/06-contrary-motion", "Contrary motion: voices move in opposite directions."),
            ("music272/07-similar-motion", "Similar motion: voices move in the same direction by different intervals."),
            ("music272/08-oblique-motion", "Oblique motion: one voice sustains while the other moves."),
            ("music272/09-parallel-motion", "Parallel motion: voices move in the same direction by the same interval (here a fourth throughout)."),
        ]
    ),
    (
        "The intervals are entirely consonant (fifth, sixth, sixth, thirteenth), and the passage is a valid first-species example.",
        [
            ("music272/10-motion-types-example", "Example 1.1 — soprano C–D–E–F against bass G–F–G–C, demonstrating alternating contrary and similar motion."),
        ]
    ),
    (
        "This prohibition applies regardless of which voices are involved, regardless of whether the parallels are in the same or different octaves",
        [
            ("music272/11-parallel-fifths-forbidden", "Parallel fifths: two voices in lockstep at the fifth, collapsing voice independence. Forbidden in strict counterpoint."),
            ("music272/13-parallel-octaves-forbidden", "Parallel octaves: two voices a perfect octave apart moving in the same direction. Equally forbidden."),
        ]
    ),
    (
        "similar motion into a perfect consonance is permissible only when the upper voice moves by step.",
        [
            ("music272/12-hidden-fifth", "A hidden (direct) fifth: voices approach a perfect fifth via similar motion with the upper voice moving by step — permitted."),
        ]
    ),
    (
        "These ranges are guidelines rather than absolute constraints; exceptional notes at the extremes are permissible for expressive effect but should not be sustained or approached carelessly.",
        [
            ("music272/14-voice-ranges", "Standard SATB voice ranges: soprano (C4–G5), alto (G3–C5), tenor (C3–G4), bass (E2–C4)."),
        ]
    ),
    (
        "Each plagal mode uses the same final as its authentic counterpart but spans the range a fourth below rather than a fifth above the final.",
        [
            ("music272/15-church-modes", "The six authentic church modes on the white keys, each starting on its final: Dorian (D), Phrygian (E), Lydian (F), Mixolydian (G), Aeolian (A), Ionian (C)."),
        ]
    ),
    (
        "the counterpoint ends on a unison or octave, approached by contrary stepwise motion.",
        [
            ("music272/17-cantus-firmus", "A typical eight-note cantus firmus in C major, presented in whole notes."),
            ("music272/16-first-species-example", "A first-species counterpoint above the cantus: one note against one, all intervals consonant, closing in contrary motion to an octave."),
        ]
    ),
    (
        "A stronger setting aims for an octave at the close: soprano proceeding E5–D5–C5–B4–A4–C5",
        [
            ("music272/18-cadential-sixth-to-octave", "The standard first-species cadence: a major sixth resolving by contrary stepwise motion to a perfect octave — the clausula vera."),
        ]
    ),
    (
        "Contrary motion should predominate; similar, oblique, and (especially) parallel motion should be used sparingly and with awareness of their harmonic implications.",
        [
            ("music272/22-parallel-thirds-bad-independence", "Parallel thirds throughout: harmonically correct but melodically inert — the added voice has no identity independent of the cantus."),
            ("music272/23-independent-melody-good", "Independent counterpoint: contrary motion and varied intervals give the added voice its own melodic identity."),
        ]
    ),
    (
        "This sixth-to-octave (or sixth-to-unison) cadential motion is the species counterpart of the V–I harmonic resolution in tonal music",
        [
            ("music272/18-cadential-sixth-to-octave", "Cadential sixth-to-octave approach: soprano on B descends by step to C while bass ascends — contrary motion to the final perfect octave."),
        ]
    ),
    (
        "The weak beat is, in this sense, a zone of relative harmonic permission: not lawless, but operating under a more lenient code than the strong beat.",
        [
            ("music272/19-second-species-passing-tone", "Second species: two half notes against each whole note; the weak-beat passing tone D (dissonant) connects the consonances E and C."),
        ]
    ),
    (
        "The consonant skip is not a dissonance treatment at all; it is a melodic option that happens to occur on a weak beat",
        [
            ("music272/20-nota-cambiata", "The nota cambiata figure E–D–B–C: the dissonant B on the third beat is quitted by an upward skip rather than by conventional stepwise resolution."),
            ("music272/21-consonant-skip", "A consonant skip on the weak beat, leaping to a consonance when stepwise continuation would produce a forbidden parallel or awkward melodic line."),
        ]
    ),
    (
        "It is the second soprano that exhibits genuine melodic independence.",
        [
            ("music272/22-parallel-thirds-bad-independence", "Soprano moving in strict parallel thirds with the bass: correct but dependent — remove one voice and the other has no identity."),
            ("music272/23-independent-melody-good", "Independent soprano: sustained G, leap to C, repeated C, step to D — passes the single-voice test as a coherent melody."),
        ]
    ),
    (
        "The discipline of systematically checking every bar-line connection",
        [
            ("music272/24-third-species-passing", "Third species: four quarter notes against each cantus whole note, with passing tones filling in the intervals between consonances."),
        ]
    ),
    (
        "the structural note E4 appears at both the beginning and end of the figure, making the neighbor notes perceptually subordinate",
        [
            ("music272/25-double-neighbor-figure", "Double-neighbor figure: E–F–D–E against a sustained C. Both F (upper neighbor) and D (lower neighbor) are dissonant weak-beat elaborations of the structural E."),
        ]
    ),
    (
        "The battuta error is treated as equivalent to a parallel between consecutive strong beats within the bar",
        [
            ("music272/26-battuta-wrong", "Battuta: parallel fifths crossing the bar line, arising between the fourth quarter note of one bar and the first quarter of the next. Equally forbidden as parallels within the bar."),
        ]
    ),
    (
        "The standard suspension types in two-voice counterpoint are named by the interval of suspension followed by the interval of resolution",
        [
            ("music272/27-suspension-7-6", "The 7–6 suspension: B held against a new C bass (seventh), resolving down by step to A (sixth)."),
            ("music272/28-suspension-4-3", "The 4–3 suspension: F held against C bass (fourth), resolving down by step to E (third)."),
            ("music272/29-suspension-9-8", "The 9–8 suspension: D above C bass (ninth), resolving down by step to C (octave)."),
            ("music272/30-suspension-2-3-bass", "The 2–3 bass suspension: the bass holds D against an upper E (second), resolving down by step to C while the upper voice is sustained."),
        ]
    ),
    (
        "A suspension must resolve by <em>stepwise downward motion</em> in the suspending voice.",
        [
            ("music272/31-chain-of-suspensions", "A chain of 9–8 suspensions over a descending bass in D minor: each resolution immediately becomes the preparation for the next suspension."),
        ]
    ),
    (
        "each rhythmic gesture chosen for its musical effect rather than for any mechanical alternation of species.",
        [
            ("music272/32-fifth-species-florid", "Fifth species (florid counterpoint): mixed note values — half notes, quarter notes, suspensions — combined freely over a sustained bass."),
        ]
    ),
    (
        "A voice ascending toward the tonic should use the raised forms, while a voice descending away from the tonic should use the natural forms.",
        [
            ("music272/33-melodic-minor", "The melodic minor scale in A: raised sixth and seventh ascending (toward the leading tone), natural sixth and seventh descending."),
        ]
    ),
    (
        "The descending-fifth sequence is the most common in tonal music because it follows the natural direction of harmonic tension",
        [
            ("music272/34-descending-fifth-sequence", "Descending-fifth sequence in G major: a chain of 7–6 suspensions over a bass descending by fifth, traversing the full harmonic cycle."),
        ]
    ),
    (
        "The strongest form of formal closure.",
        [
            ("music272/35-cadence-PAC", "Perfect authentic cadence (PAC): root-position V to root-position I with soprano arriving on the tonic — the strongest formal closure."),
        ]
    ),
    (
        "Creates a moment of structural suspension demanding continuation in a new phrase.",
        [
            ("music272/36-cadence-HC", "Half cadence: motion to the dominant (here a dominant triad), creating an open ending that demands continuation."),
        ]
    ),
    (
        "The harmonic surprise creates a moment of withheld resolution, typically followed immediately by a repetition or elaboration of the cadential gesture.",
        [
            ("music272/37-cadence-deceptive", "Deceptive cadence: V resolves to vi rather than I, withholding the expected tonic arrival."),
        ]
    ),
    (
        "The D minor invention is a masterclass in using parallel tenths as a structural device throughout an entire piece.",
        [
            ("music272/38-parallel-tenths", "Invention No. 4 in D minor style: outer voices in parallel tenths — a third in close position, an octave apart — producing a full-sounding two-voice texture."),
        ]
    ),
    (
        "It is in <em>close position</em> if the upper three voices (soprano, alto, tenor) are arranged within the span of an octave.",
        [
            ("music272/39-close-open-position", "Close position (upper three voices within an octave) versus open position (upper voices spanning more than an octave)."),
        ]
    ),
    (
        "Never double the <em>leading tone</em>: both voices would need to resolve upward by semitone to the tonic",
        [
            ("music272/40-doubling-rules", "Left: root doubled in the tonic triad (correct). Right: leading tone doubled in the dominant — both B's would produce parallel octaves on resolution."),
        ]
    ),
    (
        "<em>Voice overlapping</em> occurs when a voice moves to a pitch that exceeds the most recent pitch of an adjacent voice",
        [
            ("music272/41-voice-crossing-wrong", "Voice crossing: the alto rises above the soprano, disrupting the registral identity of both voices and confusing auditory stream segregation."),
        ]
    ),
    (
        "The cadential \\(^6_4\\) is, in effect, a double suspension over the dominant",
        [
            ("music272/42-cadential-64", "The cadential ⁶₄: C and E suspended over the dominant G bass, resolving down by step to B and D (the fifth and third of V), then resolving to I."),
        ]
    ),
    (
        "Under inversion at the octave, diatonic interval numbers transform according to \\(i \\mapsto 9 - i\\)",
        [
            ("music272/43-invertible-counterpoint-original", "Original two-voice counterpoint: upper voice G–A–F–G, lower voice E–F–D–E, all intervals are thirds."),
            ("music272/44-invertible-counterpoint-inverted", "Inverted counterpoint (voices exchanged at the octave): former lower voice now in soprano, former upper voice in bass — all thirds invert to sixths, still consonant."),
        ]
    ),
    (
        "The canon thus has no ending — it spirals upward indefinitely.",
        [
            ("music272/45-canon-at-unison", "A simple two-voice canon at the unison with a one-bar time interval: the comes (follower) enters one measure after the dux (leader), replicating it exactly."),
        ]
    ),
    (
        "A <em>retrograde canon (crab canon, cancrizans)</em>: the comes plays the dux backward",
        [
            ("music272/45-canon-at-unison", "Canon at the unison: dux and comes are the same melody, offset by one bar, creating a self-harmonizing two-voice texture."),
        ]
    ),
    (
        "The answer is called <em>real</em> if it is an exact transposition of the subject to the dominant",
        [
            ("music272/46-fugue-subject-d-minor", "A fugue subject in D minor: ascending by step from the tonic, reaching the dominant scale degree at the cadence."),
        ]
    ),
    (
        "Bach instead answers tonally: the comes opens on G but the initial ascending fifth is compressed to an ascending fourth",
        [
            ("music272/46-fugue-subject-d-minor", "Fugue subject ascending from D: the opening D–A fifth will be compressed to a fourth (A–D) in the tonal answer."),
            ("music272/47-tonal-answer-d-minor", "The tonal answer: the opening ascending fifth of the subject becomes an ascending fourth (A to D), neutralizing the tendency to overshoot into the dominant's dominant."),
        ]
    ),
    (
        "A fugue subject suitable for extended development possesses the following properties",
        [
            ("music272/46-fugue-subject-d-minor", "A well-designed fugue subject in D minor: clear tonal center (ends on the dominant), distinctive rhythm, short extractable motive (F–G–A) for episode development."),
        ]
    ),
    (
        "A <em>regular countersubject</em> appears consistently at each entry of the subject throughout the fugue",
        [
            ("music272/48-subject-with-countersubject", "The fugue subject (upper voice) combined with its countersubject (lower voice): the two are invertible, so they can exchange positions in subsequent entries."),
        ]
    ),
    (
        "Between the subject and answer entries, a brief connecting passage called the <em>codetta</em> may appear",
        [
            ("music272/49-fugue-exposition-sketch", "A two-voice fugal exposition sketch: subject enters in voice 1 (bar 1), answer enters in voice 2 (bar 3) with the countersubject continuing above in voice 1."),
        ]
    ),
    (
        "An <em>episode</em> is a developmental passage between subject entries in which the subject does not appear",
        [
            ("music272/55-fugue-episode-sequence", "A sequential episode derived from the subject's ascending-step motive, descending through a chain of fifths and passing through related key areas."),
        ]
    ),
    (
        "<em>Stretto</em> (Italian: \"tight,\" \"narrow\") is the technique in which each successive entry of the subject begins before the previous entry has concluded.",
        [
            ("music272/50-stretto", "Stretto: the answer enters two beats after the subject begins, voices overlapping before the subject has completed — mounting motivic urgency."),
            ("music272/51-augmentation", "Augmentation: the subject in its original form (upper voice) sounded simultaneously with the subject in doubled note values (lower voice) — spacious, conclusive."),
        ]
    ),
    (
        "Augmentation and diminution serve as structural devices in the middle sections and final entries of fugues",
        [
            ("music272/52-subject-inversion", "Melodic inversion of the subject: every ascending interval becomes a descending interval of the same size, creating a mirror-image countermelody."),
        ]
    ),
    (
        "The <em>Ursatz</em> (fundamental structure) is the two-voice contrapuntal skeleton underlying an entire tonal composition.",
        [
            ("music272/53-ursatz-sketch", "The Ursatz: Urlinie descending 3̂–2̂–1̂ in the soprano, Bassbrechung I–V–I in the bass — the two-voice skeleton from which all tonal elaboration proceeds."),
        ]
    ),
]

def insert_after_containing_line(lines, search_text, new_lines):
    """Find the last line containing search_text and insert new_lines after it."""
    found = False
    result = []
    for i, line in enumerate(lines):
        result.append(line)
        if not found and search_text in line:
            # Insert after this line (and the closing </div> if not already the closing line)
            # We want to insert after the </div> that follows this line
            found = True
            # Keep accumulating until we find </div>
    return result, found

def process_file(filepath, insertions):
    with open(filepath, 'r') as f:
        content = f.read()

    lines = content.split('\n')

    for search_text, scores in insertions:
        # Find line index containing search_text
        idx = None
        for i, line in enumerate(lines):
            if search_text in line:
                idx = i
                break

        if idx is None:
            print(f"WARNING: Could not find: {search_text[:60]!r}")
            continue

        # Find the closing </div> at or after this line
        close_idx = idx
        for j in range(idx, min(idx + 5, len(lines))):
            if '</div>' in lines[j]:
                close_idx = j
                break

        # Build insertion block
        block = ['']
        for score_id, caption in scores:
            block.append(f'{{{{< score id="{score_id}" caption="{caption}" >}}}}')

        # Insert block after close_idx
        lines = lines[:close_idx+1] + block + lines[close_idx+1:]
        print(f"  inserted {len(scores)} score(s) after line {close_idx+1}: {search_text[:50]!r}")

    with open(filepath, 'w') as f:
        f.write('\n'.join(lines))

    print(f"Done. Wrote {filepath}")

process_file(FILEPATH, INSERTIONS)
