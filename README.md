# Yuanshuo Du — Resume

Multi-branch LaTeX resume repo, auto-built and deployed via GitHub Actions.

## 📄 Live PDFs

| Branch | Focus | Resume | Cover Letter |
|--------|-------|--------|-------------|
| **main** | Clean base | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/main/resume.pdf" target="_blank" rel="noopener">📄 PDF</a> | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/main/coverletter.pdf" target="_blank" rel="noopener">📩 PDF</a> |
| **everdish** | Product Manager — n8n, React/MUI, CI/CD, B2B SaaS | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/everdish/resume.pdf" target="_blank" rel="noopener">📄 PDF</a> | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/everdish/coverletter.pdf" target="_blank" rel="noopener">📩 PDF</a> |
| **frontend** | React, TypeScript, Next.js, MUI, Redux | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/frontend/resume.pdf" target="_blank" rel="noopener">📄 PDF</a> | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/frontend/coverletter.pdf" target="_blank" rel="noopener">📩 PDF</a> |
| **devops** | Azure, Kubernetes, Docker, CI/CD, Terraform | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/devops/resume.pdf" target="_blank" rel="noopener">📄 PDF</a> | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/devops/coverletter.pdf" target="_blank" rel="noopener">📩 PDF</a> |
| **security** | ISO 27001, DevSecOps, SAST/DAST, KnowBe4 | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/security/resume.pdf" target="_blank" rel="noopener">📄 PDF</a> | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/security/coverletter.pdf" target="_blank" rel="noopener">📩 PDF</a> |
| **data-ai-ml** | Python, CNN (ResNet50/R-CNN), GIS, Deep Learning | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/data-ai-ml/resume.pdf" target="_blank" rel="noopener">📄 PDF</a> | <a href="https://raw.githubusercontent.com/YuanshuoDu/resume/data-ai-ml/coverletter.pdf" target="_blank" rel="noopener">📩 PDF</a> |

## ⚙️ Auto-Build

Every push to `main` triggers CI:
1. Compiles LaTeX → PDF
2. Deploys to GitHub Pages (serves as directory index)

## 🌿 Branch Structure

| Branch | Purpose |
|--------|---------|
| **main** | Clean base — GitHub Pages host only |
| **everdish** | Product Manager — n8n, CI/CD, React/MUI, B2B SaaS |
| **frontend** | Full-Stack / Frontend — React, TypeScript, Next.js |
| **devops** | DevOps / Cloud — Azure, K8s, Docker, CI/CD |
| **security** | Security / ISO 27001 — DevSecOps, KnowBe4 |
| **data-ai-ml** | Data / AI / ML — Python, CNN, GIS, Deep Learning |

> ⚠️ **Rule:** main is a clean base — no content branches are merged into it.
