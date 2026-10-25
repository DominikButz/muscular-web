# Muscular website

The marketing site for **Muscular Workout Log**, the iOS workout log app. Plain HTML, CSS and images, with no build step and no third-party scripts.

## Preview locally

```bash
./serve.sh
```

Then open http://localhost:8000/.

Use a local server rather than opening `index.html` directly. The site uses relative paths, so it behaves the same at `/` and at the GitHub Pages project path `/muscular-web/`.

Choose another port with `./serve.sh 3000`.

## Pages

| File | Purpose |
| --- | --- |
| `index.html` | Landing page |
| `support.html` | Support contact |
| `privacy.html` | Privacy policy |
| `terms.html` | Terms and conditions |
| `404.html` | Custom not-found page |

`assets/css/site.css` holds the design tokens, layout and responsive rules. `assets/img/` holds the optimized screenshots and icons. The Archivo variable font is self-hosted in `assets/fonts/`.

## Deploy to GitHub Pages

The workflow in `.github/workflows/deploy.yml` publishes the repository root on every push to `main`.

1. Create a repository named `muscular-web` on GitHub and push this folder to it.
2. In the repository, open **Settings > Pages** and set **Source** to **GitHub Actions**.
3. Push to `main`. The site appears at https://dominikbutz.github.io/muscular-web/.

`.nojekyll` stops GitHub Pages from running Jekyll, so the files are served as they are.

## Custom domain later

If you point `muscular-app.com` at GitHub Pages:

1. Add a file named `CNAME` containing `muscular-app.com`.
2. Add the DNS records GitHub lists under **Settings > Pages > Custom domain**.
3. Replace the canonical and Open Graph URLs (`https://dominikbutz.github.io/muscular-web/`) in the HTML pages, `sitemap.xml` and `robots.txt`.
4. Update the website references in `privacy.html` and `terms.html` if the old domain stops working.

## Editing content

- Copy lives directly in the HTML files.
- Screenshots are WebP files in `assets/img/`. Update the `src`, `width` and `height` attributes when swapping one.
- Colors and spacing are CSS custom properties at the top of `assets/css/site.css`.
- The App Store link is `https://apps.apple.com/us/app/muscular-workout-log/id1513704154`.
- Support email is `support@muscular-app.com`.

## Notes

- The support form and Firebase Cloud Function from the old site are gone. Support is a plain email link.
- The old stock dumbbell photo was dropped. The product screenshots are the imagery.
- The site has no JavaScript, no cookies and no analytics.
