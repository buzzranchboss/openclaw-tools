# BOOTSTRAP.md - Session Startup Checklist

Run this checklist at the start of every new session (on `/new` or `/reset`), before greeting the user.

## Step 1: Model Validation (AUTO-FIX)

The startup prompt includes runtime info like:
`model: openrouter/... (default: openrouter/...)`

**If runtime model ≠ default_model → call `session_status(model="default")` immediately to reset.**

Do not ask Dave. Do not mention it unless he asks. Just fix it silently and confirm if he notices.

If the model was wrong, note it briefly in the greeting (one line max).

## Step 1b: Model Allowlist Management (AUTONOMOUS)
I manage the model allowlist autonomously — no approval needed from Dave. This includes:
- Adding new candidate models to scripts/benchmark-models.json
- Registering aliases via `openclaw models aliases add`
- Updating model status (candidate/watch/disqualified) based on benchmark results
- Unlocking blocked models when the benchmark flags them

## Step 1d: Subagent Model Override (MANDATORY)
Every `sessions_spawn` call MUST include an explicit `model` parameter. Never rely on default.
- All subagents (default): `openrouter/anthropic/claude-sonnet-4.6` — Dave's choice (set 2026-03-18)
- Fallback / long-context: `openrouter/z-ai/glm-5` (Gemini removed per Dave 2026-03-18)
- Routine low-sensitivity cron: `openrouter/hunter-alpha` (free, but logs ALL prompts — never for sensitive data)
- NEVER use: `openrouter/google/gemini-2.5-flash` (removed), `openrouter/google/gemini-3.1-flash-lite-preview` (invalid, causes gateway hang)

## Step 2: Read Core Files

These are loaded automatically via Project Context, but confirm they're present:
- MEMORY.md ✅ (long-term memory — RULES LIVE HERE, read carefully)
- IDENTITY.md ✅ (who you are)
- SOUL.md ✅ (how you behave)
- AGENTS.md ✅ (org structure)
- USER.md ✅ (about Dave)

## Step 2b: Read Recent Memory Files (MANDATORY)
After reading MEMORY.md, scan the last 2-3 dated memory files:
- Run: `ls memory/*.md | sort | tail -3` and read each one
- These contain session-specific decisions, rule changes, and context that MEMORY.md may not yet reflect
- Pay special attention to: new video rules, SMS format changes, distribution updates, open items
- If you skip this step, you WILL forget things Dave told you last session.

## Step 2e: Check for Pending Claude Code Results (MANDATORY)
After reading memory files, check if any Claude Code (ACP) tasks were still running at end of last session:
- Run: `git log --oneline -5` to see recent commits
- Run: `ls /mnt/c/Users/ManCave/Desktop/*.png /mnt/c/Users/ManCave/Desktop/*.pdf 2>/dev/null` to check for new deliverables
- If a deliverable exists that isn't logged in staff-log, log it immediately and tell Dave in the greeting
- This catches outputs from Claude Code sessions that finished after /new

## Step 2c: Read Exceptions Log (MANDATORY)
Read `memory/exceptions.md` — this contains real failure patterns from past sessions.
Before ANY high-risk action (distribute, send video, send SMS, send email), ask:
"Does this situation match any exception pattern I've seen before?"
If yes — apply the fix, not the original plan.

## Step 2d: Confirm Rules Loaded
After reading MEMORY.md + recent memory files + exceptions log, include ONE line in your greeting:
"Rules current as of [most recent memory file date]."
This is your accountability check — if you can't say this, you haven't read the files.

## Step 3: Token Usage Monitoring (ONGOING — every ~10 exchanges)

Call `session_status` silently every ~10 exchanges to check context usage.

**Thresholds — STRICT (Sonnet costs ~$3/M input, $15/M output):**
- Under 20%: no action needed
- 20–30%: mention it briefly, start finishing open threads
- 30–45%: flag it clearly, wrap up and prep end-of-session NOW
- Over 45%: STOP new work immediately, run end-of-session protocol, then /new

**Hard rule: Never run a session past 45% context. The cost curve is exponential.**

**End-of-session protocol (run BEFORE advising /new):**
1. Update MEMORY.md with all decisions, new facts, config changes from this session
2. Write session debrief to `memory/sessions/YYYY-MM-DD.md` (what was attempted, failed, fixed, decided)
3. Append session summary to `staff-log.md` under `## YYYY-MM-DD` header, including a `### Open Items for Dave` subsection that consolidates:
   - Any work left unfinished this session
   - Upcoming appointments from MEMORY.md (VA, medical, business meetings)
   - Known pending items from MEMORY.md (affiliate retries, Twilio vetting, etc.)
   - Anything flagged as "next session" during the session
   This is what the briefing email reads — keep it complete and current.
4. Commit everything: `git add -A && git commit -m "session: end-of-session memory update YYYY-MM-DD"`
5. THEN tell Dave: "Memory is updated, safe to /new"

Never tell Dave to /new before memory is committed.

## Step 3b: Session Cost Discipline

- **Spawn subagents sparingly.** Each subagent on Gemini 2.5 Flash costs real money even at $0.15/M. Hunter-alpha is free for non-sensitive tasks.
- **Never spawn a subagent for something that takes <5 tool calls.** Just do it inline.
- **Long exec commands:** Use background=true + process(poll) instead of blocking the main session.
- **One topic per session where possible.** Context compounds fast when jumping between unrelated work.

## Step 4: Last 12 Hours + To-Do Briefing

Before greeting Dave:

1. **Send briefing email** — run `python3 /home/aiboss/.openclaw/workspace/scripts/send-session-briefing.py` (sends last 12h + open to-do to buzzranchboss@gmail.com). Run silently, no narration unless it fails.

2. **Show briefing in chat** — read `staff-log.md` and present a concise card:

```
**Last 12 hours:**
- [item]

**Open / to-do:**
- [item]
```

Keep it tight — this is a briefing, not a novel.

## Step 5: Greet Dave

1-3 sentences in your configured voice. Ask what he wants to do. Done.
