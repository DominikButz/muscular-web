# Muscular website

Context for agents working in this repository.

### What this is

The static marketing site for **Muscular Workout Log**, the iOS / iPadOS workout log app. It replaced the old Firebase-hosted React site at muscular-app.com.

Live site: https://dominikbutz.github.io/muscular-web/
Repository: https://github.com/DominikButz/muscular-web

There is no backend, no build step, no JavaScript, and no third-party requests.

### Files

| Path | Purpose |
| --- | --- |
| `index.html` | Landing page |
| `support.html` | Support contact |
| `privacy.html` | Privacy policy |
| `terms.html` | Terms and conditions |
| `404.html` | Custom not found page |
| `assets/css/site.css` | All styles and design tokens |
| `assets/fonts/archivo-latin-var.woff2` | Self-hosted Archivo variable font |
| `assets/img/` | WebP screenshots, PNG icons, SVG App Store badge, `og.png` |
| `.github/workflows/deploy.yml` | Publishes the site on push to `main` |
| `serve.sh` | Local preview |
| `robots.txt`, `sitemap.xml` | Crawler files, canonical to github.io |
| `.nojekyll` | Keeps Jekyll off if branch-based Pages is ever used |

### Local preview

```bash
./serve.sh
```

Open http://localhost:8000/. `./serve.sh 3000` uses another port. Preview with a server rather than opening the files directly.

### Design

The look is derived from the app itself: charcoal UI, the app's orange brand color, and green only for completed sets.

- Palette: `--ink #16171a`, `--ink-2 #1d1f23`, `--line #33373d`, `--text #edeef0`, `--muted #a3a8ae`, `--orange #f29b20`, `--green #3ecf6b`, `--paper #f4f4f1`.
- Type: Archivo variable (width 62 to 125, weight 100 to 900). Display headings use `font-stretch: 76%` or `78%`; body text uses 100%.
- Layout: 1180px container, hairline ruled rows instead of cards, one light "training sheet" section between dark sections.
- The hero set card is an HTML recreation of the app's workout screen. It is decorative and `aria-hidden`.
- Avoid decorative gradient washes, card kits, numbered steps, all-caps labels, and em dashes.

### Editing content

- Copy lives directly in the HTML files.
- The App Store link is `https://apps.apple.com/us/app/muscular-workout-log/id1513704154`.
- The support address is `support@muscular-app.com`, used in `support.html`, `index.html`, and `privacy.html`.
- Screenshots are WebP files in `assets/img/`. When swapping one, update the `src`, `width`, and `height` attributes.
- Keep asset and page paths relative. Do not add a leading slash. The site must work at `/muscular-web/` and at a domain root.
- Keep the legal text intact unless the user asks for changes. The privacy and terms pages still reference `www.muscular-app.com`.

### Images

Screenshots were converted with:

```bash
cwebp -q 84 -m 6 -metadata none input.png -o assets/img/output.webp
```

Phone screenshots are about 746x1496. Landscape charts were resized to 1400 wide with `-resize 1400 0`. The App Store badge is the official Apple SVG. `og.png` is a 1200x630 social preview generated from a temporary HTML page at that viewport.

### Deployment

- GitHub Pages publishes from GitHub Actions, not from a branch.
- Every push to `main` runs `.github/workflows/deploy.yml`, which copies the repo root to `_site`, uploads it, and deploys.
- Canonical base URL: https://dominikbutz.github.io/muscular-web/
- If Pages is ever disabled, enable it under **Settings > Pages** with **Source: GitHub Actions**. The default workflow token cannot create the Pages site itself.

### Custom domain

If `muscular-app.com` is pointed at GitHub Pages:

1. Add a `CNAME` file containing `muscular-app.com`.
2. Add the DNS records shown under **Settings > Pages**.
3. Replace the canonical and Open Graph URLs in all HTML pages, `sitemap.xml`, and `robots.txt`.
4. Update the support address and the website references in `privacy.html` and `terms.html` if the old domain stops working.

### Conventions

- No JavaScript unless discussed first.
- No build step, no dependencies, no package manager.
- Use semantic commit prefixes.
- Verify changes at 1440, 750, and 390 widths and confirm `scrollWidth` matches the viewport.
- The deployed site scored 100 for accessibility, best practices, and SEO in Lighthouse. Initial load is about 288 KB on desktop and 157 KB on mobile.
