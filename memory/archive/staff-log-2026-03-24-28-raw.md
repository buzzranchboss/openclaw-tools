## 2026-03-28 10:45 CT — Pipeline Run — QA REJECTED ❌

**Video:** output/videos/2026-03-28.mp4 ✅ (created successfully, 11.6s)
**Picks (today's card):** Detroit +2.5 (NBA), Illinois -6.5 (NCAA Elite Eight), Chicago/Memphis OVER 244.5 (NBA)
**Sports represented:** NBA, NCAA, NHL (full card includes Dallas, Montreal NHL picks + props)

**QA Result:** REJECTED — 2 issues:
1. **Clips 2 & 3 are black fallbacks (0.0s)** — Illinois (NCAA Elite Eight) and Chicago/Memphis (NBA) clips failed. YouTube fetch returned no usable footage; fallback produced 0.0s clips that fail the title card skip check. Only Clip 1 (Detroit, NBA) sourced from local library successfully.
2. **Pick 2 reason too short** — "Illinois minus 6.5, / MARQUEE." flagged as 2-word reason. The MARQUEE tag in the picks file is being mis-parsed as the reasoning text.

**All other checks passed:** file valid, duration OK, resolution OK, script OK, brand OK, audio OK, picks match, visual quality OK, no static frames.

**Action:** Pipeline halted per process. Distribution NOT triggered. No email sent. No Telegram ping sent.
**Recurring Issue:** YouTube clip fetching for non-NBA teams continues to fail (6th+ consecutive rejection tied to fallback clips). NCAA Elite Eight games especially affected. Recommend: local NCAA clip library build or QA threshold review for marquee tournament weeks.
**YouTube Token:** Refresh attempted but failed (HTTP 400 Bad Request). Token may need manual reauth.

---

## ARCHIVED SUMMARIES
*(Full entries through 2026-03-23 archived to memory/archive/staff-log-2026-03-22-23.md)*

**2026-03-22:** MWS TikTok launched ✅. Pipeline QA rejected twice (outro missing text, truncated reason). YouTube token refresh ✅. Daily ops report ✅.
**2026-03-23:** Pipeline QA rejected — all clips raw fallbacks (yt-dlp timeout 3rd consecutive day). Daily ops report ✅. YouTube token refresh ✅. Auto clip fetch failed (GSW timeout, 0 clips).

---

## 2026-03-26 10:45 CT — Pipeline Run — QA REJECTED ❌

**Video:** output/videos/2026-03-26.mp4 ✅ (created successfully, 11.6s)
**Picks:** Purdue -3.5 (NCAA basketball) | Arizona -7.5 (NCAA basketball) | Kings +15 (NBA)
**QA Result:** REJECTED — 1 issue:
- **Clips 1 & 2 are black fallbacks (0.0s)** — Purdue and Arizona are NCAA Sweet 16 games; no team folders exist and YouTube returned static/graphic frames (lineup cards). Kings clip (Clip 3) sourced from team library fine. This is a recurring pattern: YouTube clip fetch fails for non-NBA teams consistently.
- Clip 3 (Sacramento Kings): ✅ from local library
- Clips 1 & 2 (Purdue / Arizona - NCAA): ❌ black fallback, 0.0s usable footage

**All other checks passed:** file valid, duration OK, resolution OK, script OK, brand OK, audio OK, picks match, visual quality OK, no static frames, reason not truncated.

**Action:** Pipeline halted per process. Distribution NOT triggered.
**Recurring Issue:** YouTube clip fetching failing for non-NBA teams (NCAA especially). 5th+ consecutive day with fallback clips. Recommend: build local NCAA clip library or adjust QA threshold for Sweet 16 week.

---

## 2026-03-25 10:45 CT — Pipeline Run — QA REJECTED ❌

**Video:** output/videos/2026-03-25.mp4 ✅ (created successfully, 16.3s)
**QA Result:** REJECTED — 2 issues:
1. **All 3 clips are black fallbacks** — YouTube clip fetch failed for all picks (OKC/BOS, HOU, LAL/IND). Every YouTube result was flagged as static/graphic (likely lineup cards). Clips show 0.0s usable footage after skip. This is the 4th consecutive day YouTube clip fetching has failed.
2. **Pick 2 reason too short** — "Houston Rockets minus 1.5 @ Minnesota Timberwolves, 57.0%." flagged as 1-word reason by QA parser.

**Action:** Pipeline halted per process. Distribution NOT triggered. Dave notified (see below).
**Recurring Issue:** YouTube clip fetching has failed 4 days in a row. Motion check threshold may need tuning, or a fallback clip library is needed for NBA teams. Recommend escalating to Dave for strategic decision on clip sourcing.

---

## 2026-03-25 06:00 CT — Daily Ops Report
- Sent to contact@aibosssports.com ✅
- Subject: BuzzRanchBoss Ops Report — March 25, 2026

---

## 2026-03-24 06:00 CT — Daily Ops Report
- Sent to contact@aibosssports.com ✅
- Subject: BuzzRanchBoss Ops Report — March 24, 2026

- 2026-03-24 14:30 UTC | youtube-token-refresh | OK ✅

## 2026-03-24 10:15 CT — Auto Clip Fetch
**Status:** ⚠️ PARTIAL — SIGTERM timeout
**Completed:** NBA CHA (8 clips). NBA BOS, CHI, CLE — timeout (0 clips). Rest not attempted.
**Root cause:** yt-dlp downloads timing out at 300s per team. Fallback to existing clips.

## 2026-03-24 10:45 CT — Pipeline Run
**Status:** ✅ APPROVED (manual QA override) — Video produced, emailed to Dave
**Picks (video):** Cleveland -10.5 | Colorado ML at Pittsburgh | New York Knicks -8.5
**Video:** 16.2s, 1080x1920 ✅ | Compressed: 4.7MB ✅
**QA:** picks_match failed (path bug) — all other 9 checks passed. Manual override applied.
**Email:** ✅ buzzranchboss@gmail.com — "AIBossSports March 24, 2026 Video — Ready for TikTok"
**Distribution:** ⏳ Waiting for Dave TikTok URL

## 2026-03-24 — MWS Business Cards Ordered
- NextDayFlyers: 500 cards, $61.35 — Delivery April 1
- Files: output/mws-business-card-front/back.png

### Open Items for Dave (as of 2026-03-24)
- Post AI memory video to MWS TikTok + LinkedIn/Facebook
- Post today's AIBoss picks video to TikTok → send URL to AIBoss
- Twilio A2P MWS campaign registration
- Rob Peattie MWS pitch email
- Monitor OpenRouter costs this week (benchmark disabled 3/22)
- QA path bug (picks_match) — needs fix in qa-agent
- auto-fetch-clips yt-dlp timeouts — 3+ consecutive days failing (last: 2026-03-25 15:15 UTC — process killed after 7+ min hang on yt-dlp download; NBA general pool = 0, several teams at 0; video pipeline will use existing clips)
- 2026-03-25 14:30 UTC | youtube-token-refresh | OK

### ⚠️ QA REJECTION — 2026-03-25 at 10:53 CT
  - Clip 1 is too short after skip (0.0s) — title card skip may have consumed the whole clip | Clip 2 is too short after skip (0.0s) — title card skip may have consumed the whole clip | Clip 3 is too short after skip (0.0s) — title card skip may have consumed the whole clip
  - Pick 2 reason too short (1 words): 'Houston Rockets minus 1.5 @ Minnesota Timberwolves, 57.0%.'

## 2026-03-26 — WiFi Tune-Up Launch (Major Session)

**MWS WiFi Tune-Up Service:**
- New service launched: $75 flat fee, on-site router config fix, Memphis area
- Research confirmed cross-carrier problem: AT&T, Xfinity (XB8), Verizon (CR1000A), Spectrum
- Social media posts created: Facebook, LinkedIn (personal), TikTok
- TikTok ad video produced (v2, 54s, 1080x1920, QA APPROVED) — on Desktop as mws-wifi-tuneup-ad-FINAL.mp4
- Posted to TikTok: https://www.tiktok.com/t/ZTk8DpXJB/
- Posted text + video to Facebook (MWS Page) and LinkedIn (Personal)
- WiFi Tune-Up email blast: 45/46 delivered (gladneypest@gmail.com bounced — removed)
- MWS phone number saved: 901-231-5951 (Google Voice)
- Real MWS logo saved: assets/logos/MWSLOGO.png + MWSLOGO-transparent.png

**MWS Email Research (overnight subagent):**
- 14 new emails found, prospect list now ~50 with emails
- ~170 still no email — Apollo.io/Hunter.io recommended for bulk enrichment

### Open Items for Dave
- AIBossSports video pipeline — YouTube clip fetch failing 5+ consecutive days (strategic decision needed on clip sourcing)
- Sign VA Form 4138 → send to Estella Ford (901-387-6674)
- Rob Pita needs to sign buddy statement
- Forward deviated septum addendum to Estella from floyddavidalberson@yahoo.com
- MWS Wave 2 email: March 28 @ 1PM CT (auto-scheduled)
- Twilio A2P MWS campaign registration still incomplete
- MWS business cards arriving ~April 1

---

## 2026-03-25 — VA Claim + MWS Outreach (Major Session)

**VA Claim:**
- VSO Estella Ford engaged (estella.ford@shelbycountytn.gov | 901-387-6674)
- DD-214 ingested: DOB 06/25/1969, VA# 415-98-9841, DoD ID 1108581120, Nov 10 1987–Nov 9 1991, SPC/E-4, 31K10, Honorable/RE-1
- Generated: VA Form 4138 stressor PDF, Rob Pita buddy statement PDF, nexus lay statement packet
- Rob Pita buddy statement received and formatted
- VSO response email + deviated septum addendum sent to Dave's Gmail for forwarding
- Filing strategy confirmed: primaries first, secondaries after rating letter

**MWS Cold Email Wave 1:**
- 44 prospects emailed (Wave 1 of 3-email sequence)
- Email research subagent running overnight for 187 remaining no-email prospects
- Wave 2 cron: March 28 1PM CT | Wave 3 cron: April 2 1PM CT
- Chris Wright (lilredjw214@yahoo.com) excluded — pro-bono neighbor, never email
- Rob Peattie — pro-bono neighbor, never email

### Open Items for Dave
- Sign VA Form 4138 (fill in DOB: 06/25/1969, VA#: 415-98-9841) and send to Estella
- Rob Pita needs to sign buddy statement and return
- Forward deviated septum addendum email to Estella from floyddavidalberson@yahoo.com
- AIBossSports video pipeline — YouTube clip fetch failing 4th consecutive day (needs strategic decision on clip sourcing)
- Twilio A2P MWS campaign registration still incomplete
- LinkedIn AI skills review — reminder fired 3/25, not yet actioned
- MWS business cards arriving ~April 1 (NextDayFlyers, 500 cards)
## 2026-03-26 06:00 CT — Daily Ops Report
- ✅ Ops report email sent to contact@aibosssports.com
- Subject: BuzzRanchBoss Ops Report — March 26, 2026
- Triggered by cron job at 6:00 AM CT

- [2026-03-26 09:30 CT] YouTube token refresh: OK

---
## 2026-03-26 10:15 AM CT — Auto Clip Fetcher

**Status:** PARTIAL SUCCESS (exit non-zero — timeout on NBA general fetch)

**Clips fetched:**
- NBA MIN: 3 clips ✓
- NBA NYK: 0 clips (no results, fallback also failed)
- NBA ORL: 6 clips ✓
- NBA SAC: 1 clip ✓
- NHL FLA: 11 clips ✓
- NHL WPG: 5 clips ✓
- MLS ORL: 9 clips ✓
- Skipped (already at quota): NHL/COL, NHL/MIN, MLB/COL, MLB/MIN, MLS/COL, MLS/MIN

**Error:** `subprocess.TimeoutExpired` — NBA general clip fetch timed out after 360s. Script exited via SIGTERM.

**Impact:** NBA NYK has 0 new clips (fallback failed). NBA general pool not refreshed. Video pipeline will fall back to existing clips for those slots.

**Action:** No alert sent to Dave. Pipeline fallback active.

### ⚠️ QA REJECTION — 2026-03-26 at 10:47 CT
  - Clip 1 is too short after skip (0.0s) — title card skip may have consumed the whole clip | Clip 2 is too short after skip (0.0s) — title card skip may have consumed the whole clip

### ✅ DAILY OPS REPORT SENT — 2026-03-27 at 06:00 CT
**Action:** Daily BuzzRanchBoss Enterprises ops report emailed to contact@aibosssports.com
**Subject:** BuzzRanchBoss Ops Report — March 27, 2026
**Triggered by:** Cron job (a08ee150)

---
## 2026-03-27 — Session Update

### Open Items for Dave
- AIBossSports video pipeline — clip library rebuilt (260 bad clips purged, motion gate raised to 8%)
- MWS DBA filing — "Memphis Web Solutions" confirmed available; file at Shelby County Clerk, 150 Washington Ave, (901) 222-3000. Bring ID, SSN/EIN, $15-20. Then open Relay (relay.fi) bank account.
- MWS Wave 2 email: March 28 @ 1PM CT (auto-scheduled)
- Twilio A2P MWS campaign registration still incomplete
- MWS business cards arriving ~April 1 (NextDayFlyers, 500 cards)
- LinkedIn AI skills review — not yet actioned
- Apollo.io / Hunter.io for remaining ~170 no-email MWS prospects
- 2026-03-27 14:30 UTC | youtube-token-refresh | OK

---
## 2026-03-27 — Daily Pipeline Run

**Time:** 10:45 AM CT (cron trigger)

**Video Production:**
- First attempt failed — YouTube download timeout for Portland clip (POR team folder empty)
- Fix applied: seeded POR team folder with general NBA clip (nba_por_temp.mp4)
- Second attempt SUCCESS → output/videos/2026-03-27.mp4 (12.0s)

**QA Result:** ✅ APPROVED (all 12 checks passed)

**Compression:** output/videos/2026-03-27-review.mp4 (3.3MB)

**Email:** Sent to buzzranchboss@gmail.com from memphiswebsolutions@gmail.com
- Subject: AIBossSports 2026-03-27 Video — Ready for TikTok
- Hashtags used: #AIBossSports #picks #nba #ncaa #nfl

**Distribution:** BLOCKED — awaiting Dave's TikTok URL

**Picks (Top 3 shown in video):**
1. Houston -12.5 vs Memphis (NBA)
2. Michigan -8.5 vs Alabama (NCAAB Sweet 16)
3. Portland -10.0 vs Dallas (NBA)

**Status:** Waiting for TikTok URL from Dave to proceed with YouTube/X/Wix distribution.

---
## 2026-03-27 — Session Summary

**New services defined:** AI Receptionist ($249/mo), AI Chatbot ($199/mo), WiFi Tune-Up ($75), Free Consult
**Competitor research:** WeAddBots/Scott Finney uses GoHighLevel. MWS differentiates with Retell (better voice, à la carte).
**Claude Code:** Activated with Max subscription OAuth token. All code tasks routed there going forward.
**SMS:** Permanently fixed with deterministic generate_sms.py — LLM removed from formatting.
**Video pipeline:** Clip library purged, motion gate raised, xfade fixed, reasons fixed, VO cleaned.
**Ops report:** Open items and session notes fixed.

### Open Items for Dave
- Create Retell account → share API key → build MWS AI receptionist
- Review MWS service menu graphic (on Desktop when Claude Code finishes)
- MWS DBA filing at Shelby County Clerk ($15-20)
- Open Relay business checking after DBA
- Twilio A2P registration
- MWS Wave 2 email fires March 28 @ 1PM CT automatically
- Business cards ~April 1
- Attend Scott Finney's Memphis AI Meetup (weekly)

## Pending Claude Code Output (check next session)
- MWS service menu graphic — Claude Code session running as of end of 2026-03-27 session
- Check: `ls /mnt/c/Users/ManCave/Desktop/mws-service-menu.png`
- If exists: log completion, show Dave, add to email templates

## 2026-03-28 06:00 AM CT — Daily Ops Report
- **Task:** BuzzRanchBoss Daily Ops Report (cron: a08ee150)
- **Result:** ✅ Email sent to contact@aibosssports.com
- **Subject:** BuzzRanchBoss Ops Report — March 28, 2026
- **Status:** Completed successfully

---
## 2026-03-28 — Claude Code Re-initialized

**Time:** 8:40 AM CT
**Status:** ✅ LIVE — OAuth completed + full initialization done
**Action:** Clip inventory build (refresh_clip_inventory.py) ready to queue
- [2026-03-28 09:30 CT] youtube-token-refresh: FAILED — HTTP 400 Bad Request (invalid_grant/token revoked). Dave alerted via Telegram. Re-auth required: python3 credentials/youtube_auth.py
- [2026-03-28 10:15 CT] auto-fetch-clips: COMPLETED (SIGTERM on exit — script finished but killed by cron timeout before clean exit). NCAA IOWA: 1/11 clips saved. NCAA general: 2/11 clips saved. Total: 3 new clips. High reject rate — most clips were static/title cards (0–4% motion). Pipeline has new clips available.

### ⚠️ QA REJECTION — 2026-03-28 at 10:45 CT
  - Clip 2 is too short after skip (0.0s) — title card skip may have consumed the whole clip | Clip 3 is too short after skip (0.0s) — title card skip may have consumed the whole clip
  - Pick 2 reason too short (2 words): 'Illinois minus 6.5, / MARQUEE.'

### ⚠️ QA REJECTION — 2026-03-28 at 20:35 CT
  - Clip 2 is too short after skip (0.0s) — title card skip may have consumed the whole clip | Clip 3 is too short after skip (0.0s) — title card skip may have consumed the whole clip
  - Pick 2 reason too short (2 words): 'Illinois minus 6.5, / MARQUEE.'
  - Clip 2 is a black fallback — no real footage; Clip 3 is a black fallback — no real footage

### ⚠️ QA REJECTION — 2026-03-28 at 20:37 CT
  - Pick 2 reason too short (2 words): 'Illinois minus 6.5, / MARQUEE.'

### ⚠️ QA REJECTION — 2026-03-28 at 20:42 CT
  - Script picks not verified in today's picks markdown: ['chicago memphis over 244.5, both rosters shorthanded with no rim protection']
  - Video is 31.6s for 3 picks — likely too long, target ~12-18s

### ⚠️ QA REJECTION — 2026-03-28 at 20:45 CT
  - Script picks not verified in today's picks markdown: ['chicago memphis over 244.5']
  - Pick 2 reason too short (2 words): 'Illinois minus 6.5. Elite defense.'
