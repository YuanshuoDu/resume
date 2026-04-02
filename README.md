# Yuanshuo Du — Resume

Multi-branch LaTeX resume repo, auto-built and deployed via GitHub Actions.

## 📄 Live PDFs

| Branch | Focus | Resume | Cover Letter |
|--------|-------|--------|-------------|
| **everdish** | Product Manager — n8n, React/MUI, CI/CD, B2B SaaS | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/everdish/resume.pdf) | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/everdish/coverletter.pdf) |
| **frontend** | React, TypeScript, Next.js, MUI, Redux | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/frontend/resume.pdf) | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/frontend/coverletter.pdf) |
| **devops** | Azure, Kubernetes, Docker, CI/CD, Terraform | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/devops/resume.pdf) | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/devops/coverletter.pdf) |
| **security** | ISO 27001, DevSecOps, SAST/DAST, KnowBe4 | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/security/resume.pdf) | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/security/coverletter.pdf) |
| **data-ai-ml** | Python, CNN (ResNet50/R-CNN), GIS, Deep Learning | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/data-ai-ml/resume.pdf) | [PDF](https://raw.githubusercontent.com/YuanshuoDu/resume/data-ai-ml/coverletter.pdf) |

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
