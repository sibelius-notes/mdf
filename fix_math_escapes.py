#!/usr/bin/env python3
"""
Fix math rendering: use backslash escapes (\* and \_) inside math spans
to prevent goldmark from interpreting them as markdown emphasis.

Also reverts any previous &#42; and &#95; entity escaping.
"""
import re, glob

math_span_re = re.compile(
    r'(<span>&#92;\([^<]*?&#92;\)</span>|<span>&#92;\[[^<]*?&#92;\]</span>)'
)

def fix_span(match):
    s = match.group(0)
    if '&#92;(' in s:
        prefix, suffix = '<span>&#92;(', '&#92;)</span>'
    else:
        prefix, suffix = '<span>&#92;[', '&#92;]</span>'

    inner = s[len(prefix):-len(suffix)]

    # First, revert any previous &#42; / &#95; entity escaping
    inner = inner.replace('&#42;', '*').replace('&#95;', '_')

    # Now apply backslash escaping for * and _
    # Be careful not to double-escape: don't touch \* or \_ that already exist
    # Also don't touch * or _ that are part of &#92; or other entities

    # Process character by character to avoid breaking &#xx; entities
    result = []
    i = 0
    while i < len(inner):
        # Skip HTML entities like &#92; &#42; etc
        if inner[i] == '&' and i + 1 < len(inner) and inner[i+1] == '#':
            end = inner.find(';', i)
            if end != -1:
                result.append(inner[i:end+1])
                i = end + 1
                continue

        # Escape * and _ with backslash (if not already escaped)
        if inner[i] in ('*', '_'):
            if i > 0 and inner[i-1] == '\\':
                result.append(inner[i])  # already escaped
            else:
                result.append('\\' + inner[i])
            i += 1
            continue

        result.append(inner[i])
        i += 1

    inner_fixed = ''.join(result)
    return prefix + inner_fixed + suffix

total_files = 0
total_stars = 0
total_underscores = 0

for path in sorted(glob.glob('/home/sib/Desktop/mdf/content/**/*.md', recursive=True)):
    with open(path) as f:
        text = f.read()

    new_text = math_span_re.sub(fix_span, text)

    if new_text != text:
        # Count changes
        stars = new_text.count('\\*') - text.count('\\*')
        underscores = new_text.count('\\_') - text.count('\\_')
        with open(path, 'w') as f:
            f.write(new_text)
        rel = path.split('content/')[1]
        print(f"  {rel}: {stars} stars, {underscores} underscores escaped")
        total_files += 1
        total_stars += stars
        total_underscores += underscores

print(f"\nTotal: {total_stars} \\* and {total_underscores} \\_ in {total_files} files")
