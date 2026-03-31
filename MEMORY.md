# MEMORY.md — Long-term Memory

## User
- **Name:** 皇帝陛下
- **Call them:** 陛下
- **Email:** duyuanshuo@gmail.com
- **Timezone:** Europe/Dublin (IST)
- **Language:** Chinese (中文), English
- **Style:** 喜欢用组织管理角色（董事会+CTO+子Agent）方式工作

## Current Projects

### Resume (YuanshuoDu/resume)
- LaTeX resume using `simpleresume.cls` class
- GitHub Pages: https://yuanshuodu.github.io/resume/YuanshuoDu_Resume.pdf
- CI: GitHub Actions → xelatex build → deploy to GitHub Pages
- Known fixes: `\hrefmailto` → proper href, xelatex+microtype workaround in simpleresume.cls
- Cron: resume-iteration-1/2/3 runs daily at 03:00, 03:30, 04:00 Dublin time
- ✅ Header 图标化完成：gh/in/@ → FontAwesome5 图标（\faGithub, \faLinkedin, \faEnvelope, \faPhone, \faMapMarker）
- ✅ FontAwesome 6.6.0 Free 已安装到系统（/usr/share/fonts/opentype/）
- ✅ 字体文件已打包进项目 fonts/ 目录，CI 无需额外安装
- 源码备份：bdpan backup/resume-2026-03-29_0459/

## Credentials & APIs
- **Google OAuth:** Desktop app client_id: 852467273070-khj1fhguj8vjabf0ua4oj6qacpmmmp76 (needs Web type for sensitive scopes)
- **Baidu Netdisk (bdpan):** 已登录，用户名"弗雷尔卓德滴肾"，Token 有效约28天
- **Discord Bot:** 已配置，Token 有效

## 备份策略
- ⚠️ **永远不本地备份**！所有备份必须直接上传到 GitHub 或网盘
- 本地文件用完即删，不留备份
- 简历等重要项目：源码备份到 GitHub release 或网盘，本地不留副本

## 重要教训
- ⚠️ 配置 Discord token 时必须二次确认，写入前验证值正确性
- ⚠️ 危险配置写入后必须立即检查 gateway 状态

## 组织架构（多 Agent 团队）
- 董事长: duyuanshuo@gmail.com
- CEO (@OpenClaw机器人-1896, ou_1e45e24dddf367d3163f4bf5e8fd7b31): 经营总负责，业务目标 Owner，跨角色总协调
- CTO (我): 技术总负责，汇报给 CEO + 董事长
- 前端 & UI/UX: 隔离 workspace，在 /root/.openclaw/workspace/agents/cto/frontend
- 后端工程师: 隔离 workspace，在 /root/.openclaw/workspace/agents/cto/backend
- QA 测试工程师: 隔离 workspace，在 /root/.openclaw/workspace/agents/cto/qa
- Product Manager: 需求 Owner，汇报给 CEO（待配置）
- Scrum Master: 敏捷流程 Owner，汇报给 CEO（待配置）

## 汇报链路
董事长 ← CEO ← PM / Scrum Master
董事长 ← CEO ← CTO ← 前端 / 后端 / QA

## 协作规则
- 需要找谁就 @该职位
- 定期任务自己设定
- 协作时在任务里 @相关人员
- CTO 接收 CEO 和董事长指令，向下分发到前端/后端/QA
- 所有技术产出必须经过 QA 测试验收
- 重大技术风险直接上报董事长

## 完整协作流程
1. 董事长下达战略目标
2. CEO 分解业务目标，下达给 PM & Scrum Master
3. PM 输出需求文档，与 CTO 评审可行性
4. Scrum Master 组织迭代计划会
5. CTO 分配任务给前端、后端、QA
6. 前端做设计与页面 → 后端做接口 → 前后联调
7. QA 全程测试，提交 Bug，研发修复并回归
8. Scrum Master 每日同步进度，清除阻塞
9. 迭代完成后进行评审，PM 验收功能
10. QA 出具最终测试报告，CTO 确认技术达标
11. CEO 审核成果，批准上线
12. CEO 向董事长汇报最终结果

## 简历备份 SOP
- **触发词**: "备份简历"
- **操作**: 自动执行以下步骤：
  1. `gh release create "v$(date +%Y-%m-%d)" --repo YuanshuoDu/resume --title "Resume Backup $(date +%Y-%m-%d)" --notes "Auto backup"`
  2. 报告 Release 链接给陛下
- **无需确认**，直接执行

## larksuite/cli — 飞书官方 CLI

**安装：** `npm install -g @larksuite/cli`

**配置：**
```bash
lark-cli config init --app-id <APP_ID> --app-secret-stdin  # 非交互式
lark-cli auth login --recommend  # 推荐权限登录
lark-cli auth status  # 验证状态
```

**已配置 App：**
- App ID: `cli_a943ca5090b8dcd1`
- 用户: 杜元朔 (ou_3a2d5076c4e4f5d1d5122f485a6967e0)
- Token 有效，约 2 小时过期（自动刷新）

**优势对比 OpenClaw 原生 Feishu 工具：**
- ✅ mail 模块（邮箱）— OpenClaw 原生不支持
- ✅ vc/meetings（视频会议妙记）— OpenClaw 原生不支持
- ✅ minutes（妙记内容）— OpenClaw 原生不支持
- ✅ 更全面的 sheets 支持
- ✅ 200+ 命令，结构化输出

**常用命令速查：**
```bash
lark-cli calendar +agenda          # 今日日程
lark-cli calendar +create           # 创建日程
lark-cli im +messages-send        # 发消息
lark-cli im +chat-create           # 创建群聊
lark-cli im +messages-search      # 搜索消息
lark-cli base +record-list        # 查多维表格记录
lark-cli base +record-upsert      # 创建或更新记录
lark-cli docs +create             # 创建文档
lark-cli docs +fetch              # 读取文档
lark-cli task +get-my-tasks       # 我的任务
lark-cli task +create             # 创建任务
lark-cli mail +triage            # 邮件列表
lark-cli mail +send              # 发送邮件
lark-cli contact +search-user     # 搜索用户
lark-cli vc +search              # 搜索会议
lark-cli vc +notes               # 会议妙记
```

**Skills（AI Agent 用）：**
- lark-calendar, lark-im, lark-doc, lark-drive
- lark-sheets, lark-base, lark-task, lark-mail
- lark-contact, lark-wiki, lark-vc, lark-minutes

## Skills & Tools
- gog skill: needs Google Web OAuth configured
- Installed: skill-finder-cn, productivity, senior-architect, ui-ux-pro-max-plus, openclaw-backup, auto-update, skill-vetter

## Preferences
- Build fix workflow: check → fix → confirm GitHub Pages accessible → report URL
- Resume iteration crons run daily 03:00-04:00 Dublin time
- Backup 上传到 bdpan 后报告链接给陛下
- **图标风格偏好**：用 Lucide（Web）或 FontAwesome5（LaTeX）标准图标替代歧义缩写
  - `gh` → GitHub 图标
  - `in` → LinkedIn 图标
  - `@` → Envelope 图标
  - 电话 → Phone 图标
  - 地点 → MapPin 图标
- 不用 bullet（·），用对应图标代替

### MiniMax API 高峰时段
- **高峰**: 都柏林 07:00–09:30（= 北京 15:00–17:30）
- **安全**: 都柏林 09:30 之后到午夜
- **最佳**: 都柏林 20:00+（20:00备份、21:00更新均在最佳时段）

### 定时任务时间表（全部统一用都柏林时间）
| 任务 | 都柏林时间 | 备注 |
|------|-----------|------|
| daily-backup-2 | 20:00 | 最佳时段 |
| daily-auto-update | 21:00 | 最佳时段 |
| resume-iteration-1 | 03:00 | 安全 |
| resume-iteration-2 | 03:30 | 安全 |
| resume-iteration-3 | 04:00 | 安全 |
| google-oauth-reminder | 18:00 北京 (10:00 Dublin) | 安全 |
| daily-self-learning | 22:00 | 最佳 |

## 技术认知更新 (2026-03-28)

### 多 Agent 协作架构深度研究
- **edict (三省六部)** vs CrewAI/AutoGen 的核心差异：**制度性审核**（门下省专职审核，可封驳）
- CrewAI = 角色型编排，AutoGen = 对话型编排，edict = 制度型编排
- edict 的权限矩阵 + 状态机校验是 enterprise agent pilot 失败率60%的解法
- **对陛下架构的启发**：CTO → 子Agent 链路应加"门下省审核层"（QA 担任，有封驳权限）
- **2026趋势**：A2A 协议（Google 推动）成为 Agent 互操作标准

**A2A/MCP 关键发现 (2026-03-28):**
- MCP = Agent→tools（垂直整合），A2A = Agent→Agent（水平协作）
- A2A 核心：Agent Cards（机器可发现能力声明）+ 任务生命周期
- Google A2A 有 50+ 合作伙伴；OpenAgents 原生支持 A2A+MCP
- ⚠️ AutoGen 已进入维护模式（微软战略转向），不建议新项目使用
- **对陛下架构启发**: CTO→子Agent 链路可预留 A2A 兼容接口

### LaTeX microtype XeLaTeX vs LuaLaTeX
- XeLaTeX：**仅支持** protrusion（margin kerning），不支持 expansion/tracking/spacing
- LuaLaTeX：支持**全部** microtype 特性
- 最佳配置（LuaLaTeX）：factor=1100, stretch=8-10, shrink=8-10
- simpleresume.cls 原设计为 pdflatex+microtype全特性，与 XeLaTeX 不完全兼容（已知问题已修复）

---

## 技术认知更新 (2026-03-27)

### 多 Agent 协作架构 - edict 三省六部
- **参考项目**: cft0808/edict (13k+ stars, GitHub)
- **核心设计**: 事件驱动 + Redis Streams ACK + PostgreSQL 状态机
- **关键洞察**: 制度性审核(menxia) + 权限矩阵(allow_list) + 物理隔离workspace
- **对陛下现有架构的启发**: CTO→子Agent链路可加"门下省审核层"强制质量关卡
- **部署建议**: Docker demo 一行体验，生产环境需 OpenClaw + Redis + PostgreSQL

### Discord Bot Token 配置教训
- **关键规则**: 配置 Discord token 时必须二次确认，写入后立即验证值正确性
- **预防**: 敏感凭据写入前重复确认，写入后立即检查 gateway 状态

### Gateway 高可用
- **看门狗 cron**: `*/5 * * * * /tmp/gateway-watchdog.sh` 每5分钟检查并重启
- **systemd Restart=always 对 SIGTERM 不够可靠**，外部 cron 是必要的兜底

### OpenClaw Sub-Agent 模式
- **Hub-and-spoke 覆盖90%场景**：主agent分发，sub-agent汇报，无需复杂mesh
- **Context auto-compaction**：context窗口满时自动触发静默agentic turn写内存
- **Memory auto-indexing**：内存文件写入时自动触发索引更新
- **cwd参数隔离workspace**：sessions_spawn时指定isolated目录
- **Single bot facade**：多个agent协调但用户只看到一个bot
- **Per-agent model+reasoning**：可给不同sub-agent配置不同模型和thinking级别

### OpenClaw 2026.3.22 新特性
- Per-agent reasoning配置（QA用verbose，简单任务用low）
- OpenShell SSH沙箱安全执行代码
- Per-agent model override（MiniMax做简单任务，Claude/GPT做复杂推理）

### LaTeX microtype + 引擎兼容性
- XeLaTeX：仅支持protrusion（margin kerning），不支持expansion/tracking/spacing
- LuaLaTeX：支持全部microtype特性（protrusion+expansion+tracking+spacing）
- Resume CI修复：xelatex下禁用expansion/tracking是正确方案，但质量有损失
- 最佳实践：LuaLaTeX + microtype（factor=1100, stretch=8-10, shrink=8-10）

### Skills 对齐问题 (LaTeX)
- tabular 列中 `>{\raggedleft}` 在不同 LaTeX 引擎(pdflatex vs XeLaTeX)下行为不一致
- 最终方案: `>{\raggedleft\bfseries}p{2cm}` 列右对齐标签，p{}列对齐值
- Skills 行距最终值: 0.07-0.08cm，section标题间距 0.1-0.15cm
