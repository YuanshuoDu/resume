# Resume GitHub Pages Monitor

## User Preference
- Repo: YuanshuoDu/resume (https://github.com/YuanshuoDu/resume)
- GitHub Pages URL: https://yuanshuodu.github.io/resume/YuanshuoDu_Resume.pdf

## Workflow
1. After any push to `main` branch, check GitHub Actions build status
2. If build fails: investigate error, fix it, push fix, wait for success
3. After build succeeds: verify GitHub Pages is deployed and accessible
4. Report the GitHub Pages URL to user

## Known Issues Fixed
- `\hrefmailto` → `\href{https://mail.google.com/mail/?view=cm&to=...}{...}` (not a standard LaTeX command)
- `xelatex` + `microtype` incompatibility → added xelatex-specific microtype override in simpleresume.cls
- `pdflatex` base texlive missing packages → reverted to xelatex

## CI Workflow
- File: `.github/workflows/build.yml`
- Uses xelatex (texlive-xetex + fonts-freefont-otf)
- Deploys to GitHub Pages
