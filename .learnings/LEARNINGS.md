# Learnings

Corrections, insights, and knowledge gaps captured during development.

**Categories**: correction | insight | knowledge_gap | best_practice
**Areas**: frontend | backend | infra | tests | docs | config
**Statuses**: pending | in_progress | resolved | promoted | promoted_to_skill

---

## [LRN-20260326-001] correction | infra | resolved

**Logged**: 2026-03-26T19:50:00Z
**Priority**: critical
**Status**: resolved

### Summary
Discord bot token misconfiguration caused complete gateway failure, blocking all channels (including Feishu).

### What happened
When updating Discord bot token, the token was set incorrectly in openclaw.json. Gateway failed to start because Discord connection kept failing, and the system couldn't recover via any channel.

### Root cause
Token value written to config didn't match the user's provided token. Possible causes:
- Token was overwritten during config write
- Wrong token was used
- Config write was interrupted

### What to do differently
1. **Before writing config with sensitive tokens**: verify the exact token value matches what user provided
2. **After any config write that affects connectivity**: immediately check `openclaw gateway status` to confirm it comes back up
3. **For critical config changes**: do a dry-run first: `openclaw config set ... --dry-run`
4. **Keep backup of previous config**: `openclaw.json.bak` was created automatically but wasn't used to restore

### Prevention rule
When a user provides credentials (Discord token, OAuth keys, etc.):
- Repeat the token back to user for confirmation before writing
- After writing, verify the written value matches
- Check gateway status immediately after

---

## [LRN-20260326-002] correction | infra | resolved

**Logged**: 2026-03-26T07:30:00Z
**Priority**: high
**Status**: resolved

### Summary
Resume CI build failed due to microtype + xelatex incompatibility.

### What happened
The simpleresume.cls template uses `microtype` package with protrusion/expansion/tracking settings. XeLaTeX (used in CI) doesn't support font expansion with microtype, causing fatal errors. However, the PDF was actually generated despite the non-zero exit code.

### Fix applied
Added xelatex-specific microtype override in simpleresume.cls:
```latex
\@ifpackageloaded{iftex}{
  \ifXeTeX\microtypesetup{expansion=false,tracking=false}\fi
}
```

### What to do differently
1. When fixing LaTeX CI issues, check if PDF was actually generated (log shows "Output written on resume.pdf") before doing complex fixes
2. `xelatex` and `pdflatex` have different package compatibility - verify which engine the .cls is designed for
3. The simpleresume.cls uses `lmodern` font (pdflatex-compatible), but CI used xelatex - this mismatch caused the issue

---

## [LRN-20260326-003] correction | infra | resolved

**Logged**: 2026-03-26T07:00:00Z
**Priority**: medium
**Status**: resolved

### Summary
`\hrefmailto` is not a standard LaTeX command.

### What happened
resume.tex used `\hrefmailto:email}{text}` which is not defined in hyperref or the simpleresume class. Changed to proper `\href{https://mail.google.com/mail/?view=cm&to=email}{text}`.

### What to do differently
When fixing LaTeX link issues, use `\href{URL}{text}` format. For email links, use `https://mail.google.com/mail/?view=cm&to=email` or `mailto:email`.

---

## [LRN-20260326-004] best_practice | infra | resolved

**Logged**: 2026-03-26T19:55:00Z
**Priority**: high
**Status**: resolved

### Summary
Backup script must upload to cloud storage, not just local VPS.

### What happened
Daily backup was storing only to VPS local disk (`~/openclaw-backups/`). User requested backup to Baidu Netdisk (bdpan).

### Implementation
Updated backup.sh to:
1. Create local tar.gz backup
2. Upload to bdpan using `bdpan upload`
3. Rotate remote: keep latest 30 backups, delete oldest excess
4. Keep local: latest 7 backups

### Key insight
Local-only backups are not real backups. Cloud upload (bdpan/BOS/s3) should be part of the backup workflow.

---

## [LRN-20260326-005] insight | infra | resolved

**Logged**: 2026-03-26T14:00:00Z
**Priority**: medium
**Status**: resolved

### Summary
OpenClaw sub-agents can be spawned with isolated memory and independent workspaces.

### How it works
- `sessions_spawn runtime=subagent` creates isolated session
- `cwd` parameter sets isolated workdir per agent
- Each sub-agent reads its own AGENT.md for role definition
- Sub-agents report back via sessions_send or just complete (with announce delivery)

### Use case
CTO pattern: spawn frontend/backend/QA sub-agents with isolated workspaces for parallel work, all reporting to CTO main agent.

---

## [LRN-20260328-001] insight | multi_agent | pending

**Logged**: 2026-03-28T22:00:00Z
**Priority**: critical
**Status**: pending

### Summary
A2A Protocol (Google) — emerging standard for agent-to-agent communication, distinct from MCP.

**Key findings:**

**A2A vs MCP — different layers:**
| Protocol | What it connects | Purpose |
|----------|-----------------|---------|
| MCP (Model Context Protocol) | Agent → tools/data | Vertical integration |
| A2A (Agent2Agent) | Agent → Agent | Horizontal collaboration |
| ACP | Agent → Agent (enterprise) | MIME-typed multipart messages, cross-company |

**A2A Protocol (Google, 2025):**
- Launched with 50+ partners (Atlassian, Salesforce, SAP, Workday, etc.)
- Core concept: **Agent Cards** — machine-discoverable capability declarations
- Enables: capability discovery, negotiate responsibilities, maintain context, handle failures
- No custom integration code needed per agent pair
- Layered architecture: standardized tool access (MCP) + standardized agent communication (A2A)

**Framework A2A/MCP support status (2026):**
| Framework | A2A | MCP |
|-----------|-----|-----|
| OpenAgents | ✅ Native | ✅ Native |
| CrewAI | ✅ Growing | ⚠️ Community |
| LangGraph | ❌ | ⚠️ Via LangChain |
| AutoGen | ❌ | ⚠️ Limited |
| edict | ❌ | ❌ |

**Critical insight for CTO pattern:**
The陛下的 OpenClaw multi-agent system currently uses sessions_spawn + sessions_send for inter-agent communication — no open protocol. As the ecosystem moves toward A2A, the CTO→子Agent链路 could benefit from A2A-compatible interfaces, making it easier to plug in agents from other frameworks in the future.

**OpenAgents framework (2026):**
- Network paradigm: persistent agent communities, not one-shot pipelines
- Agents discover peers, collaborate autonomously
- Built for scale + cross-framework interoperability
- Best suited for: long-lived agent ecosystems that need open protocol support

**AutoGen trajectory warning:**
Microsoft is shifting strategic focus toward broader Microsoft Agent Framework. AutoGen (50k+ stars) will receive bug fixes + security patches but no major new features. Not a framework to build new production systems on.

---

## [LRN-20260327-001] insight | multi_agent | promoted

**Logged**: 2026-03-27T18:00:00Z
**Priority**: critical
**Status**: promoted

### Summary
cft0808/edict (三省六部) — OpenClaw multi-agent orchestration framework deep research.

**Key findings:**
- **Event-driven architecture**: Redis Streams (ACK mechanism) + PostgreSQL for task state machine
- **12 specialized agents**: taizi/zhongshu/menxia/shangshu + 6 ministries (hubu/bingbu/xingbu/libu/gongbu/libu_hr) + emperor
- **Mandatory review layer**: menxia (门下省) can veto/reject plans from zhongshu, forcing rework loop (max 3 rounds)
- **Workspace isolation**: each agent has independent workspace with own SOUL.md/MEMORY.md
- **Permission matrix**: `sub_agents.allow_list` hardcoded in agents.json, prevents unauthorized cross-agent calls
- **State machine enforced**: STATE_TRANSITIONS dict in Python, illegal transitions raise ValueError
- **Crash recovery**: Redis ACK + XAUTOCLAIM recovers stale dispatches after 30-60 seconds
- **Real-time dashboard**: React + Zustand, polls /api/live-status every 5 seconds
- **Single bot facade**: user sees one Discord/Feishu bot, but multiple agents coordinate internally

**What makes it special vs CrewAI/AutoGen:**
| | CrewAI | AutoGen | edict |
|---|---|---|---|
| Mandatory review | ❌ | ⚠️ | ✅ (menxia) |
| Real-time kanban | ❌ | ❌ | ✅ |
| Task intervention | ❌ | ❌ | ✅ (stop/cancel/resume) |
| Audit trail | ⚠️ | ❌ | ✅ (flow_log) |

**Key architectural insight for CTO pattern:**
- Agents communicate through shared PostgreSQL task records, NOT shared conversation context
- Each agent's context window only contains: own SOUL.md + own MEMORY.md + current task description
- Direct peer communication can be enabled via `directPeers` config (bypass state machine for quick chats)
- Status: 13,226 stars, 1,327 forks, actively maintained (last push: 2026-03-26)

### What to do differently
1. When designing multi-agent systems, think in terms of **制度 (institution)** not just workflow — hardcoded permission boundaries prevent chaos
2. Redis Streams ACK is the right pattern for dispatch reliability, not daemon threads
3. **Door-closer principle**: every agent can only call agents explicitly in its allow_list — no implicit trust
4. State machine transitions should be **enforced** (throw on illegal) not **allowed** (ignore on illegal)

### Relevant files
- repo: https://github.com/cft0808/edict
- key files: dispatch_worker.py, task_service.py, event_bus.py, orchestrator_worker.py, agents.json

---

## [LRN-20260327-002] insight | infra | pending

**Logged**: 2026-03-27T14:00:00Z
**Priority**: medium
**Status**: pending

### Summary
Gateway SIGTERM shutdown — systemd Restart=always not triggering on clean exit.

### What happened
Gateway received SIGTERM at 12:56:17 and shut down cleanly (exit code 143 = 128+15=SIGTERM). systemd `Restart=always` didn't restart because systemd considers SIGTERM a normal exit (listed in SuccessExitStatus=0 143).

### What to do differently
1. Set up watchdog cron as safety net: `*/5 * * * * /tmp/gateway-watchdog.sh`
2. watchdog script checks MainPID==0 → systemctl start
3. Gateway currently running fine (PID 166293, NRestarts=0 since last start)

### Prevention
- systemd restart policy is not foolproof for managed shutdowns
- External cron watchdog is the reliable safety net for always-on services

---

## [LRN-20260327-003] knowledge_gap | latex | resolved

**Logged**: 2026-03-27T22:00:00Z
**Priority**: high
**Status**: resolved

### Summary
LaTeX microtype — XeLaTeX vs LuaLaTeX feature support for protrusion/expansion/tracking.

**Key findings:**
| Feature | XeLaTeX | LuaLaTeX | pdfLaTeX |
|---------|---------|----------|----------|
| protrusion (margin kerning) | ✅ (XeTeX ≥0.9997) | ✅ | ✅ |
| expansion (font expansion) | ❌ NOT supported | ✅ | ✅ |
| tracking (letterspacing) | ❌ NOT supported | ✅ (LuaTeX ≥0.62) | ✅ |
| spacing (interword) | ❌ NOT supported | ✅ | ✅ |

**Root cause of resume CI issue:**
The simpleresume.cls uses `factor=1100,stretch=10,shrink=10` which REQUIRES font expansion. XeLaTeX doesn't support expansion, so microtype throws fatal errors. The fix applied (disabling expansion/tracking for XeLaTeX) is correct but means XeLaTeX gets NO micro-typographic improvements.

**Optimal resume CI setup:**
- Use `xelatex` but accept no expansion/protrusion (marginal quality loss)
- OR switch to `lualatex` which supports all microtype features
- OR use `pdflatex` with fontspec-free font stack (lmodern, etc.)

**Professional document recommendation:**
For best typography in PDFs: LuaLaTeX + microtype with full feature set. Factor 1100, stretch 8-10, shrink 8-10 gives best line-breaking with minimal visible irregularity.

---

## [LRN-20260327-004] insight | multi_agent | pending

**Logged**: 2026-03-27T22:00:00Z
**Priority**: high
**Status**: pending

### Summary
OpenClaw sub-agent patterns — hub-and-spoke architecture and context management.

**Key patterns discovered:**
1. **Hub-and-spoke model**: Main orchestrator agent delegates to sub-agents, sub-agents report back. Covers 90%+ of use cases. No need for complex mesh unless scaling to 4+ specialized agents.

2. **Context window auto-compaction**: OpenClaw triggers silent agentic turn when context window nears full, reminding model to write durable notes to disk before context is summarized.

3. **Memory file auto-indexing**: Smart syncing system monitors memory files and auto-triggers index updates when agent writes to them. Enables semantic search across workspace memories.

4. **Isolated workspace via `cwd`**: `sessions_spawn runtime=subagent cwd=/path/to/isolated/dir` creates isolated workdir. Each sub-agent reads its own AGENT.md for role definition.

5. **Single bot facade**: User sees one Discord/Feishu bot, but multiple agents coordinate internally. This is key UX insight — multiple agents don't mean multiple bots.

6. **Per-agent model optimization**: Main + 4 specialized sub-agents, each running different model optimized for its role (e.g., faster model for simple tasks, stronger model for complex reasoning).

**For CTO pattern (陛下's architecture):**
The current CTO→Frontend/Backend/QA structure already follows hub-and-spoke. Next improvement: add a "review gate" similar to edict's menxia layer — have QA review before output goes to CEO/董事长.

---

## [LRN-20260327-005] best_practice | multi_agent | pending

**Logged**: 2026-03-27T22:00:00Z
**Priority**: medium
**Status**: pending

### Summary
Multi-agent framework selection guide for different team sizes and use cases.

**Selection matrix:**
| Use Case | Recommended Framework | Why |
|----------|----------------------|-----|
| Quick prototyping, tool-augmented tasks | LangChain built-in agents | Fastest to get started |
| Structured team pipelines | CrewAI | Role-based YAML config, human-in-loop hooks |
| Dynamic multi-agent chat | AutoGen | Conversational collaboration, flexible |
| Complex stateful workflows | LangGraph | Directed cyclic graphs, full control |
| Software engineering simulation | MetaGPT | Predefined engineering workflow modules |
| **Production with governance** | **edict** | **PostgreSQL state machine, mandatory review gate** |
| Single-server personal assistant | OpenClaw | Multi-channel, workspace memory, no infra overhead |

**Recommendation for 陛下's team:**
- Current: OpenClaw hub-and-spoke (CTO→Frontend/Backend/QA) is correct
- Medium-term: Add menxia-style review gate (QA reviews before output)
- Long-term: If scaling to 5+ agents with complex workflows, consider edict architecture

---

## [LRN-20260327-006] insight | infra | pending

**Logged**: 2026-03-27T22:00:00Z
**Priority**: medium
**Status**: pending

### Summary
OpenClaw 2026.3.22 release — new features relevant to CTO work.

**Major features from latest release:**
- **Per-agent reasoning**: Can now configure different reasoning levels per sub-agent (e.g., QA needs "verbose" reasoning, simple tasks need "low")
- **OpenShell SSH sandboxes**: Secure code execution in isolated environments per sub-agent
- **ClawHub plugin marketplace**: 42 pull requests, plugins for web hosting, search, navigation
- **Per-agent model override**: Each sub-agent can use different models (MiniMax vs GPT vs Claude)
- **Side questions handling**: Better handling of tangentially related questions without derailing main task

**Implications for CTO pattern:**
- QA sub-agent could use `thinking=verbose` while simple task agents use `thinking=low`
- SSH sandbox enables secure backend code execution without polluting main workspace
- Per-agent model allows cost optimization: simple tasks → MiniMax-M2, complex reasoning → Claude

## [LRN-20260329-001] best_practice | latex | resolved

**Logged**: 2026-03-29T05:00:00Z
**Priority**: high
**Status**: resolved

### Summary
FontAwesome6 + XeLaTeX integration — bundling fonts in project vs system fonts.

**Key findings:**
- CI environment (GitHub Actions Ubuntu) doesn't have FontAwesome installed
- Solution: bundle FA6 OTF files in `fonts/` directory, use `fontspec`'s `Path=` option
- fontspec needs explicit `Path=fonts/` to find relative font files in XeLaTeX

**fontawesome5.sty working config:**
```latex
\newfontfamily\FAFamilySolid[Path=fonts/]{Font Awesome 6 Free-Solid-900}
\newfontfamily\FAFamilyBrands[Path=fonts/]{Font Awesome 6 Brands-Regular-400}
```

**CI workflow fix:**
```yaml
# No additional apt install needed — fonts are bundled in repo
- name: Build PDF
  run: xelatex resume.tex
```

**Key icons for resume:**
```latex
\faGithub      % GitHub (Brands)
\faLinkedin     % LinkedIn (Brands)
\faEnvelope     % Email (Solid)
\faPhone        % Phone (Solid)
\faMapMarker    % Location (Solid) — was muted color, fixed to accent
```

---

## [LRN-20260329-002] correction | latex | resolved

**Logged**: 2026-03-29T06:00:00Z
**Priority**: medium
**Status**: resolved

### Summary
fancyhdr ghost header — last section name appearing at top right of resume.

**Root cause:**
fancyhdr's default behavior puts the last `\section` title in the header area. Without explicitly clearing `\fancyhead{}`, LaTeX renders the previous section name in the top-right corner (below the blue accent bar).

**Fix applied in simpleresume.cls:**
```latex
\fancypagestyle{plain}{
  \fancyhead{}% ← Clear all headers (prevents ghost section title)
  ...
}
```

**Lesson learned:**
Always explicitly clear fancyhdr headers when customizing — don't rely on defaults being empty.

---

## [LRN-20260329-003] best_practice | latex | resolved

**Logged**: 2026-03-29T06:00:00Z
**Priority**: medium
**Status**: resolved

### Summary
Icon color consistency — MapMarker was muted while other icons were accent color.

**Problem:**
Header row 2 had `\faPhone` in accent color but `\faMapMarker` was `\color{muted}`, creating visual inconsistency.

**Fix applied:**
```latex
% Before (inconsistent)
\faMapMarker\ Dublin, Ireland  % muted color

% After (consistent)
{\color{accent}\faMapMarker\ Dublin, Ireland}  % accent color
```

**Rule:** All contact icons in header should use same color treatment (accent blue) for visual consistency.

---

## [LRN-20260329-004] best_practice | latex | pending

**Logged**: 2026-03-29T06:30:00Z
**Priority**: medium
**Status**: pending

### Summary
Lato font evaluation for resume — better than FreeSans but needs bundling.

**Key findings:**
- Lato: professional, warm, excellent screen rendering, better hierarchy than FreeSans
- Available in system at `/usr/share/fonts/truetype/lato/`
- For CI compatibility: bundle Lato TTF files in project `fonts/` directory
- Current resume CI uses Lato (tested in test/switch-to-lato branch)

**Lato TTF files needed:**
- Lato-Regular.ttf, Lato-Bold.ttf, Lato-Italic.ttf, etc.
- ~18 TTF files for complete font family

**Recommendation:** Keep current FreeSans for now (works well), consider Lato switch in future iteration.

---

## [LRN-20260329-005] insight | latex | resolved

**Logged**: 2026-03-29T06:30:00Z
**Priority**: medium
**Status**: resolved

### Summary
Resume Summary section — paragraph vs bullet format decision.

**Analysis:**
- Bullet format: higher scanability, better for recruiters who skim
- Paragraph format: better for narrative-driven applications (academic, creative)
- For technical resume: bullets preferred (recruiters spend 6-10 seconds initial scan)

**User preference:** 陛下 prefers paragraph format for Summary

**Final decision:** Paragraph format kept per user preference. Leading blue bar removed (unnecessary for single paragraph).

---

## [LRN-20260329-006] best_practice | latex | pending

**Logged**: 2026-03-29T10:00:00Z
**Priority**: low
**Status**: pending

### Summary
Resume page geometry — bottom margin vs footer proximity.

**Finding:**
Increasing bottom margin from 1.2cm to 1.5cm gives footer more breathing room.

**Applied in simpleresume.cls:**
```latex
\geometry{a4paper,left=1.7cm,top=1.2cm,right=1.7cm,bottom=1.5cm}
```

**Note:** Balance between content density and whitespace — 1.5cm bottom margin is minimal safe distance for footer from page edge.

## [LRN-20260330-001] insight | multi_agent | pending

**Logged**: 2026-03-30T09:41:00Z
**Priority**: high
**Status**: pending

### Summary
A2A Protocol v0.3.0 — Google's agent interoperability standard now in active development.

**Latest developments (2026):**
- A2A Protocol v0.3.0 announced, building on April 2025 launch with 50+ partners
- Core concept: **Agent Cards** — machine-discoverable JSON manifests of agent capabilities
- Enables: peer-to-peer negotiation, task handoff, context preservation across agent boundaries
- Differentiator vs MCP: MCP = vertical (agent→tools), A2A = horizontal (agent↔agent)
- New in 2026: UCP (Universal Commerce Protocol) for agent-based shopping

**Google A2A Codelabs** available for building purchasing concierge agents.

**Framework adoption status:**
| Framework | A2A Support | Notes |
|-----------|-------------|-------|
| OpenAgents | Native | Built for A2A+MCP |
| LangChain | Via LangGraph | Community adapters |
| CrewAI | Growing | Community A2A adapters |
| AutoGen | Limited | Not strategic priority |

**For CTO pattern (陛下架构):**
Current OpenClaw sub-agent mechanism (sessions_spawn/sessions_send) is proprietary. A2A readiness means:
1. Agent Cards can be exposed as API endpoints for future federation
2. A2A can coexist with OpenClaw — use A2A for cross-framework agents, sessions_spawn for intra-team
3. No immediate migration needed, but design with A2A-compatible capability manifests

---

## [LRN-20260330-002] best_practice | infra | pending

**Logged**: 2026-03-30T09:41:00Z
**Priority**: high
**Status**: pending

### Summary
OpenClaw 2026 workspace isolation patterns — sub-agent configurations for power users.

**Best practice configurations (2026):**

1. **Hub-and-spoke dominates** — 90%+ use cases don't need complex mesh. Main orchestrator delegates, sub-agents report back. Only scale to 4+ agents if needed.

2. **Per-agent model optimization** — Each sub-agent can run different models:
   - Simple tasks: MiniMax-M2 (fast, cheap)
   - Complex reasoning: Claude/GPT (slower, capable)
   - QA: verbose thinking
   - Code: higher reasoning budget

3. **Workspace isolation via `cwd`**:
   ```python
   sessions_spawn(
     runtime="subagent",
     cwd="/path/to/isolated/workspace",
     task="..."
   )
   ```
   Each sub-agent reads its own AGENT.md/MEMORY.md

4. **Sandboxing options**:
   - `sandbox: {mode: "always"}` — full isolation
   - `sandbox: {mode: "non-main"}` — only non-primary agents sandboxed
   - `sandbox: {mode: "off"}` — trusted agents

5. **Routing rules** — bind agents to channels:
   ```json
   {
     "routing": {
       "rules": [
         {"match": {"channel": "discord"}, "agent": "engineering"},
         {"match": {"channel": "feishu"}, "agent": "support"}
       ]
     }
   }
   ```

**For 陛下's CTO pattern:**
- Current: CTO→Frontend/Backend/QA with sessions_spawn is correct
- Enhancement: Add per-agent model override (MiniMax for simple, Claude for complex)
- Next: Consider sandbox config for untrusted sub-agents

---

## [LRN-20260330-003] best_practice | latex | pending

**Logged**: 2026-03-30T09:41:00Z
**Priority**: medium
**Status**: pending

### Summary
LaTeX typography — professional document setup checklist.

**Essential packages for professional output:**

1. **microtype** — subtle refinement, requires LuaLaTeX for full features
2. **fontspec** — OpenType font loading (XeLaTeX/LuaLaTeX)
3. **parskip** — consistent paragraph spacing
4. **setspace** — line spacing control

**Common issues resolved:**
- `\hrefmailto` — not standard, use `\href{https://mail.google.com/mail/?view=cm&to=email}{text}`
- fancyhdr ghost headers — always clear with `\fancyhead{}`
- Icon color consistency — all icons same treatment (accent vs muted)
- Font bundling for CI — fonts/ directory in project, use fontspec `Path=`

**Engine recommendation for resume:**
- LuaLaTeX: Full microtype support, best typography
- XeLaTeX: Protrusion only, acceptable quality
- pdflatex: Legacy, limited font selection

---

## [LRN-20260329-007] insight | infra | resolved

**Logged**: 2026-03-29T19:55:00Z
**Priority**: high
**Status**: resolved

### Summary
lark-cli (官方飞书 CLI) 安装、配置与功能深度研究。

**What is lark-cli:**
- 飞书官方出品的命令行工具（MIT 协议）
- GitHub: https://github.com/larksuite/cli
- 覆盖 11 大业务域、200+ 命令、19 个 AI Agent Skills
- 三层调用：快捷命令（+前缀）→ API 命令 → 通用 raw API

**安装与配置:**
```bash
npm install -g @larksuite/cli
npx skills add larksuite/cli -y -g  # 安装 skills

# 配置 App ID
echo $SECRET | lark-cli config init --app-id cli_xxx --app-secret-stdin

# 登录授权（会输出 URL，在浏览器完成）
lark-cli auth login --recommend

# 验证
lark-cli auth status
```

**与 OpenClaw 原生 Feishu 工具对比:**

| 功能 | OpenClaw 原生 | lark-cli |
|------|---------------|----------|
| 日历 | ✅ | ✅ +更多快捷 |
| 消息 | ✅ | ✅ +搜索 |
| 多维表格 | ✅ | ✅ +dashboard/workflow |
| 云文档 | ✅ 读 | ✅ 读/写/创建 |
| 任务 | ✅ | ✅ +子任务 |
| **邮箱** | ❌ | ✅ 完整支持 |
| **视频会议/妙记** | ❌ | ✅ |
| **Sheets** | ❌ | ✅ 完整 |

**安全说明（官方警告）:**
- 输入防注入、OS 密钥链存储
- 建议仅私人对话使用，勿拉入群聊
- AI Agent 调用以用户身份执行授权范围操作

**Key insight:**
lark-cli 是 OpenClaw Feishu 工具的**补充**，特别补全了：
1. 邮箱操作（mail 模块）
2. 视频会议妙记（vc + minutes 模块）
3. 更完整的 sheets 支持

**常用命令:**
```bash
lark-cli calendar +agenda      # 今日日程
lark-cli im +messages-send    # 发消息
lark-cli base +record-list    # 查记录
lark-cli mail +triage        # 邮件列表
lark-cli vc +search          # 搜索会议
```

**Note:** Token 有效期约 2 小时，会自动刷新。配置持久化在 `/root/.lark-cli/config.json`。
