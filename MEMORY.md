## MEMORY.md — Living Rulebook
_Loaded every session. Rules here override older memory files._

## CRITICAL: Distribution Process
- NO auto-distribution. Dave posts TikTok first, sends URL → AIBoss downloads as `YYYY-MM-DD-tiktok-master.mp4`.
- **ALWAYS check `output/distribution-log.json` first.** `"status": "distributed"` → DO NOT run distribute.py.

## CRITICAL: SMS Format (AIBossSports)
- Top 3 = first 3 SIDES picks, same order. Use exact format from `memory/sms-format-template.md`.
- Footer ONLY: `=================\nPlay it safe. No hype.` No duplicates. Present copy-paste ready, no modifications.

## Video Pipeline — SCRAPPED 2026-04-04
- Crons disabled: sports-distribution, auto-fetch-clips, youtube-token-refresh. Do not re-enable without Dave approval.

## CRITICAL: Email Read Access (IMAP)
- Can READ inboxes via IMAP. Credentials: `credentials/email-monitor.json`. Accounts: buzzranchboss@gmail.com, contact@aibosssports.com, contact@memphiswebsolutions.com. Script: `scripts/check-email-now.py`.

## CRITICAL: Always Email Outputs
Any deliverable/report/notable output → email buzzranchboss@gmail.com first, then share in chat.

## CRITICAL: Write Memory Immediately
- Write every completed task to memory/YYYY-MM-DD.md AND update MEMORY.md if durable — right then. If session ends abruptly → check git log + recent memory files.

## CRITICAL: Infrastructure & Cost
- Before any cancellation/financial change: inventory EVERY tool/cron that could bill — partial analysis is dangerous.
- Same failure 2+ consecutive days → own the fix. Escalate only if credentials/strategy needed.
- Session start: scan staff-log for recurring errors. "2nd consecutive" or higher = fix immediately.

## HARD RULES: MWS Email Compliance
- Check BOTH mws-unsubscribe-list.json AND mws-suppression-list.json before every send.
- Damron Dental (drdamron@damrondentalcare.com) — permanently suppressed.
- NEVER promise "last email"/frequency commitments or describe unbuilt features.
- NEVER send external emails without Dave reviewing copy. Ops emails to buzzranchboss@gmail.com are fine.
- Before Google/OAuth/API flows: verify not deprecated. Service accounts can't upload to personal YouTube — OAuth only.

## HARD RULE: ROI Filter (applies to EVERYTHING)
Before suggesting, building, or spending time on ANY task, ask: "What's the realistic revenue return vs. time/cost?" If the answer is weak — say so immediately, don't build first. High ROI now: phone pain outreach, LinkedIn posts, affiliate recruitment, warm email to verified prospects. Low ROI: video production without distribution plan, new Gumroad products without traffic, social posts without targeting.

## HARD RULES: Ops Discipline
- **staff-log first:** Before any to-do list or status update, read staff-log.md.
- **Claude Code: CANCELLED.** Not in use — policy enforcement blocks it with OpenClaw. Do all code work inline or via Codex. Never mention or attempt to spawn Claude Code.
- **Remove Dave as bottleneck:** Before asking Dave anything, ask: "Can I resolve this myself?" If yes — do it. Only escalate: credentials/API keys Dave must generate, strategic go/no-go decisions, and genuine external blockers.
- **Brand separation:** AIBossSports ≠ MWS. Never cross-post. If publish fails → STOP, don't fallback.
- **Complete the job:** Built = deployed/live. Research → Test → Analyze → Present → Approval → High Value + Low Effort first.
- **No standalone LLM API calls in Python scripts.** All AI work runs as OpenClaw agentTurn cron jobs.
- **Netlify deploy method:** Use zip deploy (POST /sites/{id}/deploys). Files API returns 404 — do not use. Always deploy full-site zip (netlify_deploy_file.py handles this).
- **After every website change:** Wait 2 minutes, then verify the site returns 200 and the changed file/page is accessible. If down — redeploy immediately. No exceptions. Use background exec (sleep + curl) or Haiku agentTurn for this check — never burn Sonnet tokens on a simple HTTP verify.
- **Gumroad PDF delivery:** Set delivery URL at product creation via gumroad_publish.py --pdf. Product update API is dead (404). Cover upload API is also dead — use Netlify URL pasted into dashboard.
- **Platform strategy:** Gumroad now. Migrate to Payhip Pro (~$99/mo, 0% fees, instant payouts) when revenue hits $1K/mo consistently. Monitor for platforms with full automated delivery (product create + cover + file all via API).

## Models & Cost Control
- Main session: claude-sonnet-4.6. Crons: haiku-4.5 for ops, sonnet-4.6 for picks/complex tasks.
- Anthropic Max plan: CANCELLED 2026-04-05. Refund claimed — no further action needed.

## Social Posting APIs (LIVE)
- **X:** scripts/post_to_x.py — credentials/x_credentials.json — OAuth1, @BRB_Enterprises
- **LinkedIn:** scripts/post_to_linkedin.py — credentials/linkedin.json — token 60 days, use /v2/ugcPosts NOT /rest/posts
- **Pinterest:** NOT YET — needs Dave's business account → OAuth setup

## MWS Pricing (DAVE SETS ALL PRICING — never assume or change)
- AI Receptionist: $249/mo | AI Chatbot: $199/mo | WiFi Tune-Up: $75 one-time

## Products & Revenue
- **Newsletter:** LLM Weekly Scorecard Report — MWS brand, $9/mo or $90/yr, **Buttondown**. Launched 2026-04-02.
- OpenClaw Operations Playbook ($29): https://buy.stripe.com/14A00i57E6M3eR2f47eUU07
- OpenClaw Operations OS Notion Template ($19): https://buy.stripe.com/28EdR8eIeeev6kwbRVeUU08
- Bundle Playbook + Notion OS ($39): https://buy.stripe.com/14AbJ08jQgmD24g1dheUU09
- AI Receptionist Guide ($29): https://buy.stripe.com/fZu4gybw25HZ6kw5txeUU02
- **Gumroad:** buzzrancher.gumroad.com — Products #1-6 live (prompts packs, playbook, HVAC)
- HVAC Prompts ($9): https://buzzrancher.gumroad.com/l/wyelpb (LIVE 2026-04-08)
- **First Reddit sale:** $29 OpenClaw Playbook via r/SideProject (2026-04-08) ✅
- **Netlify:** buzz.memphiswebsolutions.com LIVE — strong-frangipane-6111db.netlify.app

## MWS Social
- TikTok + Instagram: @memphiswebsolutions. Caption: short hook + @memphiswebsolutions.com + 5 hashtags.
- Twitter/X: @MemWebSol (Dave Alberson)

## AIBossSports Picks Rules
- Top 3 SIDES picks = SMS Top 3. Remaining picks: SMS + blog only (not public video).
- **Parlays DISABLED** in generate_daily_picks.py (2026-04-04, -41.4u record).

## MWS Pro-Bono (never pitch, charge, or email)
- Rob Peattie (garage door) | Chris Wright (lilredjw214@yahoo.com, lawn care)

## HARD RULE: No PII in Public Posts
- NEVER mention "Dave", "Dave Alberson", or any human name in public-facing posts (X/Twitter, Gumroad, social media)
- Refer to the human partner as "my human partner" or omit entirely
- Internal tools (staff-log, memory files, email to buzzranchboss@gmail.com) are fine

## REVENUE TARGET
- **$25,000/month** — primary goal for BRBenterprises + MWS combined
- Milestones: $1K/mo (May 1) → $5K/mo (Jun 1) → $15K/mo (Aug 1) → $25K/mo (Oct 1)
- Track: Gumroad + Stripe combined. Weekly check every Monday.

## Open Items (2026-04-08)
- **Twilio A2P** (SID: CM906c297e331725c3046b61549bb0f8e0) — SMS blocked, re-enable ~mid-April
- **Etsy API** — keystring saved, pending approval. Priority when approved — organic traffic.
- **Next products** — Auto Repair prompts (build + email 16 prospects), Cleaning Biz, Lawn Care, Notion template
- **Pinterest** — Dave needs to create business account (pinterest.com/business/create) then send me email used → I wire OAuth + post all 7 products
- **Auto repair email campaign** — 16 clean emails ready in mws-prospects-new.json. Build prompts first.
- **Salon email scrape** — need to scrape salon owner emails. Biggest underserved niche.
- **Gumroad covers** — paste 6 Netlify cover URLs into Gumroad dashboard manually (API dead)
- **HVAC Prompts cover** — needs manual upload in Gumroad dashboard (API dead)
- **Reddit OAuth creds** — needed to auto-post launch copy (output/reddit-product-launch-posts.md ready)

---
*Last updated: 2026-04-08 daily cost review*
