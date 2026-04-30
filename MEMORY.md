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
