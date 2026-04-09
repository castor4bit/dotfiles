#!/bin/bash
input=$(cat)

eval "$(echo "$input" | jq -r '
  @sh "MODEL=\(.model.display_name // "?")",
  @sh "CTX=\(.context_window.used_percentage // 0 | floor)",
  @sh "COST=\(.cost.total_cost_usd // 0)",
  @sh "R5H=\(.rate_limits.five_hour.used_percentage // 0 | floor)",
  @sh "R5H_RESET=\(.rate_limits.five_hour.resets_at // 0)",
  @sh "R7D=\(.rate_limits.seven_day.used_percentage // 0 | floor)",
  @sh "R7D_RESET=\(.rate_limits.seven_day.resets_at // 0)",
  @sh "DIR=\(.workspace.current_dir // ".")"
')"

NOW=$(date +%s)

R5H_LEFT=$(( (R5H_RESET - NOW) / 60 ))
[ "$R5H_LEFT" -lt 0 ] && R5H_LEFT=0
R5H_HM=$(printf '%dh%02dm' $((R5H_LEFT / 60)) $((R5H_LEFT % 60)))

R7D_LEFT=$(( R7D_RESET - NOW ))
[ "$R7D_LEFT" -lt 0 ] && R7D_LEFT=0
R7D_DH=$(printf '%dd%02dh' $((R7D_LEFT / 86400)) $(((R7D_LEFT % 86400) / 3600)))

BRANCH=$(git -C "$DIR" branch --show-current 2>/dev/null)
DIR=$(basename "$DIR")

echo "[$MODEL] $DIR${BRANCH:+ ($BRANCH)} | ctx:${CTX}% 5h:${R5H}%(${R5H_HM}) 7d:${R7D}%(${R7D_DH}) | \$$(printf '%.2f' "$COST")"
