#!/bin/sh
HOOK_NAME=$(basename "$0")
GLOBAL_HOOK="$HOME/.gitcfg/hooks/$HOOK_NAME"
if [ -x "$GLOBAL_HOOK" ]; then
  "$GLOBAL_HOOK" || exit 1
fi
