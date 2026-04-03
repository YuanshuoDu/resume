# ── Resume.tex UI improvements ────────────────────────────────────────────────
content = open('resume.tex').read()

# 1. Summary box: slightly less vertical padding top (0.28→0.20cm)
content = content.replace('{\\vspace{0.28cm}%', '{\\vspace{0.20cm}%')

# 2. Summary box bottom: reduce from 0.22 to 0.16cm
content = content.replace('\\vspace{0.22cm}\n      \\end{minipage}', '\\vspace{0.16cm}\n      \\end{minipage}')

# 3. More breathing room between Summary and Skills section (0.12→0.18cm)
content = content.replace('\\endgroup\n\\vspace{0.12cm}\n\n% ── Skills', '\\endgroup\n\\vspace{0.18cm}\n\n% ── Skills')

open('resume.tex', 'w').write(content)
print('Resume UI fixes applied')

# ── Coverletter.tex UI improvements ──────────────────────────────────────────
content2 = open('coverletter.tex').read()

# 1. Skills section: increase gap before from 0.35cm to 0.48cm
content2 = content2.replace(
    '\\vspace{0.35cm}\n\n% ── SKILLS',
    '\\vspace{0.48cm}\n\n% ── SKILLS'
)

# 2. Tagline block: reduce internal padding from 0.35 to 0.28 top/bottom
content2 = content2.replace(
    '      \\vspace{0.35cm}%',
    '      \\vspace{0.28cm}%'
)

# 3. CTA section: a bit more breathing room above (0.30→0.40cm)
content2 = content2.replace(
    '\\vspace{0.3cm}\n\n\\noindent%',
    '\\vspace{0.40cm}\n\n\\noindent%'
)

open('coverletter.tex', 'w').write(content2)
print('Cover letter UI fixes applied')

# Verify
print("\nVerification:")
print("resume.tex vspace changes:", content.count('\\vspace'))
print("coverletter.tex vspace changes:", content2.count('\\vspace'))
