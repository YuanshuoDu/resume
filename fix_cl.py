content = open('coverletter.tex').read()

# Fix 1: Opening paragraph - add missing comma after "isn't"
content = content.replace(
    "until it isn't --- I",
    "until it isn't, --- I"
)

# Fix 2: Why section - remove the placeholder bracket placeholders for ATS readability
# The "[their engineering blog / ...]" pattern gets collapsed to just the gist
content = content.replace(
    "I follow \textbf{[their\n  engineering blog / compliance initiatives / security newsletters]} closely",
    "I follow their engineering blog, compliance initiatives, and security newsletters closely"
)

content = content.replace(
    "I follow \textbf{[their engineering blog / compliance initiatives / security newsletters]} closely",
    "I follow their engineering blog, compliance initiatives, and security newsletters closely"
)

# Fix 3: "What I Bring" - bullet #1 starts with "Reduced" - already good but 
# let's ensure "Reduced" isn't lowercase after semicolons
# Check current state of bullet 1
idx = content.find("Reduced employee phishing click-through")
print("Bullet 1 starts at:", idx)
print("Context:", repr(content[idx:idx+80]))

open('coverletter.tex', 'w').write(content)
print('Done')
