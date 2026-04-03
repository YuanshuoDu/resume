content = open('coverletter.tex').read()

# Fix 1: Why section - remove bracket placeholders, make professional generic
# Replace [Company Name] with a clean version
content = content.replace(
    "\\textbf{[Company Name]}'s commitment to building secure, compliant systems\n  at scale is exactly the culture I'm looking for.",
    "[Company]'s commitment to building secure, compliant systems\n  at scale is exactly the culture I'm looking for."
)

content = content.replace(
    "I follow \\textbf{[their\n  engineering blog / compliance initiatives / security newsletters]} closely",
    "I follow their engineering blog, compliance initiatives, and security newsletters closely"
)

# Fix 2: Closing CTA - strengthen "two-way fit" phrasing
content = content.replace(
    "If this sounds like a\n  two-way fit, I'd welcome the chance to discuss how I could contribute to\n  your team's next challenge.",
    "If this sounds like a mutual fit, I'd welcome a conversation about how\n  I could contribute to your team's next challenge."
)

# Fix 3: Replace "two-way fit" with more professional phrasing
content = content.replace(
    "two-way fit",
    "mutual fit"
)

# Fix 4: Add line break for readability in the why section
content = content.replace(
    "--- the same values I've developed",
    "---\n  the same values I've developed"
)

open('coverletter.tex', 'w').write(content)
print('Done')
print("Checking key sections:")
for kw in ["mutual fit", "engineering blog", "Company Name", "two-way fit"]:
    idx = content.find(kw)
    if idx >= 0:
        print(f"  FOUND '{kw}': {repr(content[max(0,idx-20):idx+40])}")
    else:
        print(f"  OK: '{kw}' removed/replaced")
