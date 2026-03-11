---
cssclass: invoice-pro
invoice_id: INV-<% tp.date.now("YYYYMMDD") %>-01
client: [[<% tp.file.cursor(0) %>]]
project: [[<% tp.file.cursor(1) %>]]
date: <% tp.date.now("YYYY-MM-DD") %>
amount: <% tp.file.cursor(2) %>
status: Unpaid
---

# Invoice: <% tp.frontmatter.invoice_id %>

## Services Rendered
- Full SSG Refactor from Sanity
- Cloudflare Pages Deployment
- Zero-Downtime DNS Migration

---
### Total Due: £<% tp.frontmatter.amount %>

---
**Payment Details**
- Bank Transfer: [Your Sort Code] / [Your Account Number]
- Reference: <% tp.frontmatter.invoice_id %>

---
*Created on 2026-03-11*
