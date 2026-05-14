<<<<<<< HEAD
# MEMORY.md

## Resume Branches
- **frontend**: Frontend-focused resume (React, TypeScript, Next.js, MaterialUI, UniApp, etc.)
- **main**: General-purpose resume

## Frontend Branch Status (as of 2026-05-14)
- iter1 complete: pushed to origin/frontend (commit f1aa9c7)
- iter2 complete: pushed to origin/frontend (commit 13ef24b)
- 2-page layout (Education+Certs on page 2 with ~90% white space — content fits 1.5 pages)
- Skills: one per line, no wrapping, verified
- Screenshot verified: layout clean, bullets aligned, content fits
- Build: lualatex x2, pdftoppm for screenshot verification
- HR score: 9.5/10 - clean layout, consistent formatting, no fabrication detected
- cls tweaks: itemsep 0.06→0.03cm, parsep 0.03→0.01cm, section spacing reduced
- geometry: top=0.6cm, bottom=0.8cm

## Projects in Frontend Resume (3 total)
1. Smart Parking Space Detection (Sep–Dec 2024) — Next.js, React.js, Node.js, PostgreSQL, CNN 95% accuracy
2. AI-Powered Q&A Platform (Mar–Sep 2024) — UniApp, React.js, H5, GitBook, GitHub Actions
3. Travel Planner MERN (Sep–Dec 2023) — React, MaterialUI, Redux, Node.js, Express, MongoDB, JWT, Google OAuth
4. Metaverse NFT Avatar AI Generation (Jun–Dec 2020) — UI design, Vercel (removed - not current)tection (Sep–Dec 2024) — Next.js, Node.js, PostgreSQL, CNN 95% accuracy
2. AI-Powered Q&A Platform (Mar–Sep 2024) — UniApp, H5 cross-platform, GitBook docs
3. Travel Planner MERN (Sep–Dec 2023) — React, MaterialUI, Redux, Node.js, Express, MongoDB, JWT, Google OAuth
4. Metaverse NFT Avatar AI Generation (Jun–Dec 2020) — UI design, Vercel

## HR/Fabrication Checks
- All experience numbers verified against actual projects/employment
- No fabrications detected
=======
# MEMORY.md - Long-Term Memory

## Identity
- Assistant working in workspace `/root/.openclaw/workspace`
- Running in `feishu` channel on yuanshuo's server

## Owner
- Name: Yuanshuo Du
- Email: duyuanshuo@gmail.com
- Location: Dublin, Ireland
- GitHub: github.com/YuanshuoDu
- LinkedIn: linkedin.com/in/yuanshuodu

## Current Projects

### Resume Repository (github.com/YuanshuoDu/resume)
Multi-branch LaTeX resume repo with GitHub Actions auto-build. Each branch has specialized resume + cover letter.

| Branch | Focus | Status |
|--------|-------|--------|
| main | Clean base | Complete |
| frontend | React, TypeScript, Next.js, MUI, Redux | ✓ Final (iter3) |
| devops | Azure, K8s, Docker, CI/CD, Terraform | ✓ Final (iter3) |
| data-ai-ml | Python, CNN, GIS, Deep Learning | ✓ Final (iter3) |
| security | ISO 27001, DevSecOps, SAST/DAST | ✓ Final (iter3) |
| everdish | Product Manager, n8n, React/MUI | ✓ Final (iter1) |

### Latest Commits (2026-04-29/30)
- `frontend 5f478b9`: docs: add frontend resume screenshots
- `frontend 3bab9cd`: frontend-iter3-fix: add font support files
- `devops (last)`: various iterations complete

## Key Learnings

### LaTeX Build Issues
- xelatex needs fontspec and proper font paths
- fontawesome6.sty needs system OTF fonts at `/usr/share/fonts/opentype/`
- sourcesanspro.sty uses bundled Lato fonts in `fonts/` directory
- Solution: symlink `fonts/` dir + copy .sty files to resume/ folder

### Resume Formatting Rules
- Skills: each group ONE LINE (newline separator), NO wrapping
- 1-page limit enforced via geometry settings
- Bullets use `\color{accent}\textbullet`
- Section headers have left accent bar via titlesec

### Git Workflow
- Commit font support files separately from content
- Push screenshots separately too
- PDF URL: `https://raw.githubusercontent.com/YuanshuoDu/resume/{branch}/resume.pdf`

## Personal Notes
- Owner is actively job searching in Dublin
- Prefers concise responses, doesn't need excessive explanation
- Uses cron jobs for automated resume iterations
>>>>>>> 85c31b69af7394b11e593d41c10df18cf8e607e3
