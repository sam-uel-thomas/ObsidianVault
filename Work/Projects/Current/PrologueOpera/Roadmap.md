# Prologue Opera — Site Launch Roadmap

**Deadline:** 25th March 2026

---

## Overview

Converting the Prologue Opera site from a dynamic Sanity CMS pull to a static site generator (SSG) with webhook-triggered rebuilds, hosted on Cloudflare Pages.

**Final Stack:**

- **Domain** → Namecheap (registrar only - move happens *after* launch)
- **DNS** → Cloudflare (controls the "signposts" during the move)
- **Email** → Google Workspace (MX records must be copied to Cloudflare)
- **CMS** → Sanity (client edits here)
- **Build** → Node.js build script (fetches from Sanity, outputs static HTML)
- **Hosting** → Cloudflare Pages (free)

**How it works:**

> Client publishes in Sanity → webhook hits Cloudflare Pages → build script fetches & bakes HTML → static files go live

---

## Pre-Work (Complete by March 16th)

_~30 mins total, do whenever_

- [ ] Create Cloudflare account at cloudflare.com
- [ ] Make sure project is pushed to GitHub
- [ ] Create Namecheap account (ready for the administrative transfer later)

---

## Tuesday 17th March — Core SSG Refactor

### Session 1 — Build Script & Logic (1.5 hrs)

- [ ] Refactor `sanity-integration.js` so all render functions return HTML strings
- [ ] Write `scripts/build.js` — Node script to fetch from Sanity and write to `dist/`
- [ ] Run build script locally and verify `dist/` folder output

---

## Wednesday 18th March — Deployment & Automation

### Session 1 — Cloudflare Pages & Webhook (1.5 hrs)

- [ ] Connect GitHub repo to Cloudflare Pages
- [ ] Set build command: `node scripts/build.js` & publish directory: `dist/`
- [ ] **Private Preview:** Confirm site is live on `*.pages.dev` URL (Old site is still live on the main domain)
- [ ] Set up Sanity Webhook (API → Webhooks) using Cloudflare's build hook URL
- [ ] Test a Sanity change and confirm the `*.pages.dev` site updates automatically

---

## Thursday 19th March — Client Feedback

### Session 1 — Review & Edits (1 hr)

- [ ] Send `*.pages.dev` link to client for final approval
- [ ] Address any copy or design amends
- [ ] Verify SEO meta tags and social sharing previews

---

## Friday 20th March — Go-Live Prep

### Session 1 — Readiness Check (30 mins)

- [ ] Final sign-off on the preview site
- [ ] **DNS Audit:** Log into Squarespace and document current MX records (for Google Workspace)
- [ ] Ensure you have the Squarespace login ready for Monday's switch

---

## Monday 23rd March — GO LIVE DAY (Zero-Downtime)

### Session 1 — The DNS Switch (1 hr)

- [ ] **Point the "Signposts":** In Squarespace Settings > Domains, change Nameservers to Cloudflare's (e.g., `dara.ns.cloudflare.com`)
- [ ] **Configure Cloudflare:** In the Cloudflare dashboard, add the records:
    - CNAME pointing to your Cloudflare Pages URL
    - MX records for Google Workspace (to ensure email doesn't break)
- [ ] Add `prologueopera.com` as a Custom Domain in the Cloudflare Pages dashboard
- [ ] **Verification:** Confirm `prologueopera.com` now loads the new site (usually within 1 hour)

### Session 2 — Administrative "Paperwork" (30 mins)

- [ ] _Now that the new site is live_, initiate the Registrar Transfer from Squarespace to Namecheap
- [ ] Unlock domain in Squarespace, get EPP code, and start transfer in Namecheap
- [ ] _This move happens in the background over 5–7 days with zero impact on the live site_

---

## 25th March — Deadline ✓

Project completed. Site is live, automated, and ownership is securely at Namecheap.

---

## Notes

- **Why this order?** Changing Nameservers first (DNS) gives us instant control. Moving the Registrar (Namecheap) is just administrative and takes too long to do *before* launch.
- **Email Safety:** We must copy the MX records to Cloudflare *before* switching nameservers to ensure the client's Google Workspace email never stops working.

---
*Updated on 2026-03-11*
