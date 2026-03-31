# Daily Self-Learning — 2026-03-29

## 主题：lark-cli 飞书官方 CLI 深度研究

---

## 一、项目概述

**GitHub:** https://github.com/larksuite/cli

**官方描述：**
> 飞书/Lark 开放平台命令行工具 — 让人类和 AI Agent 都能在终端中操作飞书。

**Stars:** 13k+
**License:** MIT
**语言:** Go

---

## 二、核心特性

| 特性 | 说明 |
|------|------|
| **官方出品** | Bytedance/LarkSuite 官方 |
| **Agent 原生** | 19 个 Skills，适配主流 AI 工具 |
| **覆盖面广** | 11 大业务域、200+ 命令 |
| **三分钟上手** | 一键创建应用、交互式登录 |
| **安全可控** | 输入防注入、OS 密钥链存储 |

---

## 三、三层调用架构

### Layer 1: 快捷命令（+前缀）— 人机友好

```bash
lark-cli calendar +agenda              # 今日日程
lark-cli calendar +create              # 创建日程
lark-cli im +messages-send            # 发消息
lark-cli im +chat-create             # 创建群聊
lark-cli im +messages-search         # 搜索消息
lark-cli base +record-list           # 查记录
lark-cli base +record-upsert         # 创建或更新记录
lark-cli docs +create                # 创建文档
lark-cli docs +fetch                 # 读取文档
lark-cli task +get-my-tasks          # 我的任务
lark-cli task +create                # 创建任务
lark-cli mail +triage               # 邮件列表
lark-cli mail +send                 # 发送邮件
lark-cli contact +search-user        # 搜索用户
lark-cli vc +search                  # 搜索会议
lark-cli vc +notes                  # 会议妙记
```

### Layer 2: API 命令 — 平台同步

```bash
lark-cli calendar calendars list
lark-cli calendar events instance_view
lark-cli im chats list
lark-cli base table-list
```

### Layer 3: 通用调用 — 全 API 覆盖

```bash
lark-cli api GET /open-apis/calendar/v4/calendars
lark-cli api POST /open-apis/im/v1/messages \
  --params '{"receive_id_type":"chat_id"}' \
  --data '{"receive_id":"oc_xxx","msg_type":"text","content":"{\"text\":\"Hello\"}"}'
```

---

## 四、11 大业务域详解

### 1. 📅 Calendar（日历）

```bash
lark-cli calendar +agenda           # 今日议程
lark-cli calendar +create            # 创建日程
lark-cli calendar +freebusy          # 查忙闲
lark-cli calendar +suggestion        # 智能建议会议时间
lark-cli calendar calendars list      # 列出日历
lark-cli calendar events list        # 列出事件
```

**优势：** OpenClaw 原生日历支持，但 +suggestion（智能建议会议时间）是新增的实用功能。

### 2. 💬 IM（即时通讯）

```bash
lark-cli im +messages-send         # 发消息（支持 text/markdown/post/media）
lark-cli im +messages-reply        # 回复消息
lark-cli im +chat-create          # 创建群聊
lark-cli im +chat-messages-list    # 列出消息
lark-cli im +messages-search       # 搜索消息
lark-cli im +messages-resources-download  # 下载媒体
```

**重要限制：** `+messages-send` 需要 **bot 身份**，不是 user 身份。

### 3. 📄 Docs（云文档）

```bash
lark-cli docs +create             # 创建文档
lark-cli docs +fetch              # 读取文档（Markdown 格式）
lark-cli docs +update             # 更新文档
lark-cli docs +search            # 搜索文档
lark-cli docs +media-download    # 下载媒体
lark-cli docs +media-insert     # 插入媒体
```

**优势：** 支持读写，OpenClaw 原生只支持读取。

### 4. 📊 Base（多维表格）

```bash
lark-cli base +base-create        # 创建多维表格
lark-cli base +table-list         # 列出表格
lark-cli base +record-list        # 列出记录
lark-cli base +record-upsert     # 创建或更新记录
lark-cli base +record-get        # 获取单条记录
lark-cli base +field-list        # 列出字段
lark-cli base +view-list         # 列出视图
lark-cli base +form-list         # 列出表单
lark-cli base +dashboard-create  # 创建仪表盘
lark-cli base +workflow-create   # 创建自动化流程
lark-cli base +data-query        # 数据查询 DSL
```

**这是最强大的模块！** 支持仪表盘、自动化流程、数据聚合查询。

### 5. 📈 Sheets（电子表格）

```bash
lark-cli sheets +spreadsheet-create  # 创建表格
lark-cli sheets +spreadsheet-read    # 读取表格
lark-cli sheets +spreadsheet-write    # 写入表格
lark-cli sheets +spreadsheet-export   # 导出
```

**OpenClaw 原生不支持 sheets，lark-cli 补全了这个空白。**

### 6. ✅ Tasks（任务）

```bash
lark-cli task +create              # 创建任务
lark-cli task +get-my-tasks        # 我的任务
lark-cli task +complete           # 完成任务
lark-cli task +assign            # 分配任务
lark-cli task +comment           # 添加评论
lark-cli task +reminder          # 设置提醒
lark-cli task +tasklist-create   # 创建任务清单
```

### 7. 📧 Mail（邮箱）

```bash
lark-cli mail +triage            # 邮件列表（摘要）
lark-cli mail +messages          # 读取多封邮件
lark-cli mail +message           # 读取单封邮件
lark-cli mail +send             # 发送邮件
lark-cli mail +reply            # 回复（草稿）
lark-cli mail +forward          # 转发（草稿）
lark-cli mail +draft-create     # 创建草稿
lark-cli mail +draft-edit       # 编辑草稿
lark-cli mail +watch            # 监听新邮件（WebSocket）
```

**这是 OpenClaw 原生完全不支持的模块！** 邮箱是重大补充。

### 8. 👤 Contact（通讯录）

```bash
lark-cli contact +get-user       # 获取用户信息
lark-cli contact +search-user   # 搜索用户
```

### 9. 📚 Wiki（知识库）

```bash
lark-cli wiki spaces list         # 列出知识空间
lark-cli wiki nodes list         # 列出节点
```

### 10. 🎥 VC（视频会议）

```bash
lark-cli vc +search              # 搜索会议
lark-cli vc +notes              # 获取会议妙记
```

### 11. 🗒️ Minutes（妙记）

```bash
lark-cli minutes minutes list     # 列出妙记
```

---

## 五、AI Agent Skills

lark-cli 自带 19 个预制 Skills，专门为 AI Agent 优化：

| Skill | 说明 |
|-------|------|
| lark-shared | 配置、认证、身份切换 |
| lark-calendar | 日历日程 |
| lark-im | 即时通讯 |
| lark-doc | 云文档 |
| lark-drive | 云空间 |
| lark-sheets | 电子表格 |
| lark-base | 多维表格 |
| lark-task | 任务 |
| lark-mail | 邮箱 |
| lark-contact | 通讯录 |
| lark-wiki | 知识库 |
| lark-event | 事件订阅 |
| lark-vc | 视频会议 |
| lark-minutes | 妙记 |
| lark-openapi-explorer | API 探索 |
| lark-skill-maker | 自定义 Skill |
| lark-workflow-meeting-summary | 会议纪要汇总 |
| lark-workflow-standup-report | 日程待办摘要 |
| lark-whiteboard | 画板 |

**Skills 安装：**
```bash
npx skills add larksuite/cli -y -g
# 或指定单个
npx skills add larksuite/cli -s lark-calendar -y
```

---

## 六、认证与配置

### 安装

```bash
npm install -g @larksuite/cli
npx skills add larksuite/cli -y -g
```

### 配置 App ID（非交互式）

```bash
# 方式1：环境变量
export LARK_APP_ID=cli_xxx
export LARK_APP_SECRET=xxx
lark-cli config init

# 方式2：直接指定
echo $SECRET | lark-cli config init --app-id cli_xxx --app-secret-stdin
```

### 登录授权

```bash
# 推荐权限（自动选择常用 scopes）
lark-cli auth login --recommend

# 按域筛选
lark-cli auth login --domain calendar,task,mail

# 指定 scope
lark-cli auth login --scope "calendar:calendar:readonly"
```

### 身份切换

```bash
# 以用户身份执行
lark-cli calendar +agenda --as user

# 以机器人身份执行
lark-cli im +messages-send --as bot
```

### 验证状态

```bash
lark-cli auth status
# 输出示例：
# {
#   "ok": true,
#   "identity": "user",
#   "userName": "杜元朔",
#   "userOpenId": "ou_xxx",
#   "expiresAt": "2026-03-29T21:12:07Z"
# }
```

---

## 七、输出格式

```bash
--format json    # JSON（默认）
--format pretty  # 人性化格式
--format table   # 表格
--format ndjson  # 换行分隔 JSON（管道处理）
--format csv     # CSV
```

**自动翻页：**
```bash
--page-all       # 自动获取所有页
--page-limit 5   # 最多 5 页
--page-delay 500 # 每页间隔 500ms
```

---

## 八、与 OpenClaw 原生工具对比

| 功能 | OpenClaw Feishu | lark-cli | 结论 |
|------|-----------------|----------|------|
| 日历管理 | ✅ | ✅ | 持平 |
| 消息发送 | ✅ | ✅ | 持平 |
| 多维表格 | ✅ | ✅ +dashboard/workflow | lark-cli 更强 |
| 云文档读 | ✅ | ✅ | 持平 |
| 云文档写 | ❌ | ✅ | lark-cli 胜 |
| 任务管理 | ✅ | ✅ | 持平 |
| **邮箱** | ❌ | ✅ 完整 | **lark-cli 独有** |
| **视频会议** | ❌ | ✅ | **lark-cli 独有** |
| **妙记** | ❌ | ✅ | **lark-cli 独有** |
| **Sheets** | ❌ | ✅ | **lark-cli 独有** |

**结论：lark-cli 是 OpenClaw Feishu 工具的超级，补全了邮箱、视频会议、妙记、Sheets 等空白。**

---

## 九、实际测试记录

**测试命令：**
```bash
lark-cli contact +search-user --query "杜元朔"
```

**输出：**
```json
{
  "ok": true,
  "identity": "user",
  "data": {
    "users": [
      {
        "name": "杜元朔",
        "open_id": "ou_3a2d5076c4e4f5d1d5122f485a6967e0",
        "user_id": "a8cbfcd4"
      }
    ]
  }
}
```

**结论：** ✅ 功能正常，输出结构化 JSON。

---

## 十、安全提醒（官方警告）

1. **AI Agent 调用风险**：模型幻觉、执行不可控、提示词注入
2. **建议**：仅私人对话使用，勿拉入群聊
3. **凭证存储**：使用 OS 原生密钥链
4. **不要主动修改安全配置**

---

## 十一、适用场景

**适合用 lark-cli 的场景：**
- 自动化工作流（定时任务、脚本）
- 批量操作（批量创建、批量更新）
- 需要邮箱功能的自动化
- 需要 Sheets 完整功能的场景
- AI Agent 集成（Claude Code、Cline 等）

**适合用 OpenClaw 原生的场景：**
- 日常对话式交互
- 实时消息处理
- 简单的日历/任务操作

**最佳实践：** OpenClaw 原生 + lark-cli 互补使用。

---

## 十二、下一步探索

1. **测试邮件功能** — 体验 +triage、+send
2. **测试多维表格高级功能** — dashboard、workflow
3. **测试 Sheets** — 创建和操作电子表格
4. **集成到 cron** — 用 lark-cli 实现定时邮件报告
5. **探索 AI Agent Skill** — 看能否给 OpenClaw 也做一个 lark skill
