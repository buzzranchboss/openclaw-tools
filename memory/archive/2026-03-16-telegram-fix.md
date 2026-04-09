# Session: 2026-03-16 04:57:59 UTC

- **Session Key**: agent:main:telegram:slash:6981273911
- **Session ID**: be611875-ac2a-45ed-b8ac-5454683cd579
- **Source**: webchat

## Conversation Summary

user: Sender (untrusted metadata):
```json
{
  "label": "openclaw-control-ui",
  "id": "openclaw-control-ui"
}
```

[Sat 2026-03-14 23:32 CDT] hello?
assistant: Hey Dave — I'm here. What do you need?
user: Sender (untrusted metadata):
```json
{
  "label": "openclaw-control-ui",
  "id": "openclaw-control-ui"
}
```

[Sat 2026-03-14 23:34 CDT] my telegram broke - it says "400 anthropic/claude-3-5-sonnet-latest is not a valid model ID" - and I know that - but why did starting a new session cause a problem? I thought we fixed it...
assistant: Let me pull the config and see what's going on.
assistant: Found it. The Telegram channel doesn't have a `model` override specified, so when a new Telegram session starts, it's supposed to inherit `defaults.model.primary` — which is correctly set to `openrouter/anthropic/claude-sonnet-4.6`.

But the error says it's trying to use `anthropic/claude-3-5-sonnet-latest` — that's the bare OpenRouter-prefixed alias listed under `models` as `"Sonnet 3.5"`. That model ID isn't valid for direct use (it needs the `openrouter/` prefix).

The fix: add an explicit `model` to the Telegram channel config so it doesn't fall through to something unexpected. Let me check what the docs say first.
assistant: Now I have the full picture. Let me also check the Telegram session to see exactly what model it's trying to use when new sessions start:
assistant: Got it — found the root cause. Let me look at the sessions.json to see exactly what's happening:
assistant: **There it is.** The Telegram session has a stored `modelOverride` of `anthropic/claude-3-5-sonnet-latest` (missing the `openrouter/` prefix). This was baked into `sessions.json` during all the chaos earlier today. Even though `openclaw.json` is correctly set to `openrouter/anthropic/claude-sonnet-4.6`, the Telegram session is ignoring it because it has a stale bad override locked in at the session level.

The fix is to clear that bad override from `sessions.json`. Let me do it:
assistant: Now restart the gateway so it picks up the clean sessions state:
