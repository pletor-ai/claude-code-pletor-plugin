#!/bin/sh
set -eu

root=$(dirname "$0")/..
known=$(curl -sf -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json, text/event-stream" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list","params":{}}' \
  https://api.pletor.ai/mcp | jq -r '.result.tools[].name')

cited=$(grep -rhoE '`[a-z]+(_[a-z]+)+`' "$root/README.md" "$root/pletor" | tr -d '`' | sort -u)

missing=0
for name in $cited; do
  case "$name" in
    set_up_my_brand|make_on_brand) continue ;;
  esac
  if ! printf '%s\n' "$known" | grep -qx "$name"; then
    echo "not a live tool: $name"
    missing=1
  fi
done

[ "$missing" -eq 0 ] && echo "all cited tools exist on https://api.pletor.ai/mcp"
exit "$missing"
