# LEARNINGS.md

## 2026-04-26
- When feishu_bitable_app_table_field is used to create a hyperlink field (type=15), the `property` parameter must be completely omitted — passing an empty object `{}` causes a URLFieldPropertyError.
