#!/bin/bash
# スキル固有コンテキストの注入ディスパッチャ。
# skill-context-injectors/<skill名>.md にプロンプト文を置くだけで、additionalContextとして注入される。
# 対応イベント:
#   - PreToolUse (Skill): アシスタントがSkillツールを呼び出した場合
#   - UserPromptSubmit: ユーザーが /skillname と直接入力した場合
INPUT=$(cat)

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
EVENT=$(echo "$INPUT" | jq -r '.hook_event_name // empty')

case "$EVENT" in
  PreToolUse)
    SKILL=$(echo "$INPUT" | jq -r '.tool_input.skill // empty')
    ;;
  UserPromptSubmit)
    SKILL=$(echo "$INPUT" | jq -r '.prompt // empty' | grep -oE '^/([a-zA-Z0-9_-]+)' | sed 's|^/||')
    ;;
  *)
    exit 0
    ;;
esac

if [[ -z "$SKILL" ]]; then
  exit 0
fi

PROMPT_FILE="$SCRIPT_DIR/skill-context-injectors/$SKILL.md"

if [[ -f "$PROMPT_FILE" ]]; then
  MSG=$(cat "$PROMPT_FILE")
  jq -n --arg event "$EVENT" --arg ctx "$MSG" \
    '{hookSpecificOutput: {hookEventName: $event, additionalContext: $ctx}}'
else
  exit 0
fi
