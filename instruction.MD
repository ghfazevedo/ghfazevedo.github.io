# ghfazevedo.github.io — detailed instructions

This file explains how the website is organised, what each folder and file does, and how to read
the code inside them. The short version is the **Quick guide** below; everything after it is reference.

The site is built with [Hugo](https://gohugo.io) (a static-site generator) and a small custom theme
that lives entirely in this repository (`layouts/` + `assets/css/main.css`). There is no external
theme to update.

---

## Contents

1. [Quick guide](#1-quick-guide)
2. [How the site is built](#2-how-the-site-is-built)
3. [Syntax primer (YAML, Markdown, Hugo templates, CSV)](#3-syntax-primer)
4. [Folder-by-folder reference](#4-folder-by-folder-reference)
5. [Troubleshooting](#5-troubleshooting)

---

## 1. Quick guide

### Preview on your computer
Double-click **`preview.bat`**. The browser opens at <http://localhost:1313> and refreshes every time
you save a file. (The first time, it offers to install Hugo with `winget`.)
Drafts (`draft: true`) are visible in the preview but **not** on the published site.

### Publish
Commit and push to the `main` branch. GitHub Actions rebuilds and publishes the site in ~1–2 minutes
(see the *Actions* tab on GitHub). The site is also rebuilt automatically every day.

### Where things are

| To change…                                 | Edit                                                                 |
|--------------------------------------------|----------------------------------------------------------------------|
| Name, tagline, position, links, CV, analytics | `hugo.yaml` → `params:`                                            |
| Top menu (order, names, items)             | `hugo.yaml` → `menus: main:`                                         |
| Home: pitch, About text, “Path” list       | `content/_index.md`                                                  |
| Research programs (home cards + Research page) | `content/research/_index.md` (figures `program-1.png`… in the same folder) |
| Publications                               | `data/publications.yaml` (thumbnails in `assets/media/pubs/`)        |
| Publications page intro text               | `content/publications/_index.md`                                     |
| News (home page)                           | `data/news.yaml` (photos in `assets/media/news/`)                    |
| Teaching / Codes tiles and pages           | one folder per item in `content/teaching/` or `content/codes/`, with `index.md` + `featured.png/jpg` |
| Teaching / Codes page intro (`lead`)       | `content/teaching/_index.md`, `content/codes/_index.md`              |
| Fieldwork map and albums                   | `content/fieldwork/_index.md` + `content/fieldwork/pins.csv` + one photo folder per album |
| Museums map and albums                     | `content/museums/_index.md` + `content/museums/pins.csv` + one photo folder per album |
| Outreach events                            | `content/outreach/_index.md` + one photo folder per event            |
| About me page                              | `content/about_me/_index.md` (photos in the same folder)             |
| Portrait / emblem / favicon                | `assets/media/avatar.jpg`, `icon.png`, `icon-ink.png`                |
| Paper texture background                   | `assets/media/oldmanuscript.png`                                     |
| Colours and fonts                          | `:root { … }` block at the top of `assets/css/main.css`              |
| CV PDF                                     | `static/uploads/` + `cv:` in `hugo.yaml`                             |

### Add a publication
Copy one block in `data/publications.yaml` and edit it. Your name is put in bold automatically.
Optional thumbnail: save a small figure in `assets/media/pubs/` and write its file name in `image:`.
Add `selected: true` to show it on the home page (the first 3 selected ones, in file order, are used).
Papers with a `status:` (e.g. `in review`) are grouped under **In review**; delete the `status:` line
once the paper is published and add `doi:` / `volume:`.

### Add a news item
Add a block at the **top** of `data/news.yaml` (the home page shows the first 5):
```yaml
- date: "Oct 2026"
  text: "Something happened — [link](https://example.org)."
  image: myphoto.jpg      # optional, file in assets/media/news/
  alt: Short description of the photo
```
A tall image (e.g. a journal cover) is shown as a thumbnail beside the text; a wide one is shown under it.

### Add a tutorial or a code
Create a folder, e.g. `content/codes/mytool/`, with an `index.md`:

```yaml
---
title: MyTool
label: R package · 2026
summary: One sentence about it.
external_link: https://github.com/ghfazevedo/mytool   # leave out to write a full page below
weight: 10            # order of the tiles (smaller first)
draft: true           # optional: visible in preview only
---
```
and an image called `featured.png` (or `.jpg`) in the same folder.
To show a GitHub README as the page instead, replace `external_link:` with
`readme: https://raw.githubusercontent.com/ghfazevedo/mytool/main/README.md` (see [§4.4.4](#444-contentteaching-and-contentcodes)).

### Add a fieldwork/museum album or an outreach event
1. Create a folder next to the `_index.md` (e.g. `content/fieldwork/arizona-2023/`) and drop the photos in.
2. Add a block under `albums:` (Fieldwork/Museums) or `events:` (Outreach) with `folder: arizona-2023`.
3. (Map pages only) Add rows to `pins.csv` and put the folder name in the `album` column to link pins and photos.

### Update the CV
Put the PDF in `static/uploads/` and change `cv:` in `hugo.yaml`
(e.g. `cv: /uploads/GHFA_CV_10_2026.pdf`). All “CV” buttons update automatically.

### Visitor statistics
The site uses [GoatCounter](https://www.goatcounter.com) (free, no cookies). The code is in
`hugo.yaml` → `goatcounter:`. Dashboard: `https://<code>.goatcounter.com` (private, login required).
Local previews are never counted.

---

## 2. How the site is built

```
content/  (pages: Markdown + front matter, photos)      ┐
data/     (publications.yaml, news.yaml)                 │
assets/   (CSS, images that Hugo resizes)                ├──►  hugo  ──►  public/  ──►  GitHub Pages
static/   (files copied as-is, e.g. the CV PDF)          │
layouts/  (HTML templates that combine all of the above) │
hugo.yaml (site-wide settings)                           ┘
```

* **Content** says *what* to show; **layouts** say *how* to show it. You almost never need to touch `layouts/`.
* Every page is one of two kinds:
  * a **section** page = a folder with an `_index.md` (underscore). Example: `content/research/_index.md` → `/research/`.
  * a **single** page = a folder with an `index.md` (no underscore) inside a section. Example:
    `content/codes/poda/index.md` → `/codes/poda/`.
* The folder name becomes the URL (lower-cased; `content/teaching/Phylogenomics/` → `/teaching/phylogenomics/`).
* Hugo chooses the template by section: `content/research/` uses `layouts/research/section.html`; if no
  specific template exists, the generic `layouts/section.html` / `layouts/page.html` is used.
* Images placed next to a page (“page resources”) or in `assets/` are resized and converted to WebP
  automatically at build time, so you can drop full-size photos in — the visitor downloads small versions.
* `public/` and `resources/` are generated by Hugo; they are ignored by git and can be deleted at any time.

---

## 3. Syntax primer

### 3.1 YAML (settings, front matter, data files)

YAML is used in `hugo.yaml`, in the front matter of every `.md` file, and in `data/*.yaml`.

```yaml
key: value                 # a setting; text after # is a comment (ignored)
title: "Text: with colon"  # use quotes when the text contains  :  #  or starts with * [ { "
year: 2026                 # numbers need no quotes
selected: true             # true / false
empty:                     # nothing after the colon = empty value (the item is simply not shown)

list:                      # a list: each item starts with "- " at the same indentation
  - first
  - second

albums:                    # a list of blocks (each "- " starts a new block)
  - title: Chile 2018
    year: 2018             # keys of the same block are aligned under each other
  - title: Utah 2021
    year: 2021

pin_types:                 # a nested map, inline form {key: value, key: value}
  visit: { label: Collection visited, color: "#B06D12" }

inline_list: [Guilherme, Azevedo]

folded: >-                 # long text; line breaks become spaces, final newline dropped
  First line
  continues here.
literal: |                 # long text; line breaks are kept
  Line one
  Line two
```

Rules that cause most errors:
* **Indentation must be spaces, never tabs**, and consistent inside a block (2 spaces is the convention here).
* Colours start with `#`, so they must be quoted: `color: "#A8322D"`.
* Text beginning with `*` (italics) or `[` (a link) must be quoted: `text: "[CNPq grant](https://…)"`.
* A line such as `preprint: #https://…` is an **empty** value followed by a comment — this is a handy
  way to keep a link “switched off”.

### 3.2 Front matter (top of each Markdown page)

Every `.md` file under `content/` starts with a YAML block between two `---` lines; everything after the
second `---` is the page body in Markdown:

```markdown
---
title: Research          # front matter (YAML): settings for this page
lead: "Intro text"
---

Body text in **Markdown**. This is what templates call `.Content`.
```

Front-matter keys used by this site (not every page uses every key):

| Key | Meaning |
|-----|---------|
| `title` | Page title (H1 and browser tab). |
| `lead` | Intro paragraph under the title (Markdown allowed). |
| `label` | Small uppercase line above titles/tiles, e.g. `Tutorial · RevBayes · 2026`. |
| `summary` | One sentence on the tile; also used as the page description for search engines/link previews. |
| `weight` | Sort order of tiles (smaller first). |
| `draft: true` | Shown only in the local preview. |
| `external_link` | Tile links to this URL instead of to a page on the site. |
| `link_text` | Text at the bottom of the tile (default `Open →`, or `Open ↗` for external links). |
| `toc: true` | Show a “Contents” box built from `##` and `###` headings. |
| `readme` | Raw GitHub URL of a Markdown file to display as the page body. |
| `translations` / `lang_label` | Language switch at the top of a page (see Teaching). |
| `resources_from` | Use images stored in another page’s folder. |
| `build: { list: never }` | Page exists but gets no tile on its section page. |
| `build: { publishResources: false }` | Files in that folder (Word files, CSVs, originals) are not copied to the public site; only the processed images are. |

### 3.3 Markdown (page bodies and most text fields)

```markdown
## Heading 2          ### Heading 3          (do not use a single # — the page title is the H1)
*italics*  **bold**  ~~strikethrough~~  `code`
[link text](https://example.org)       <https://example.org>
- bullet list                          1. numbered list
![alt text](image.jpg)                 image stored in the page folder
![alt text](image.jpg "Caption")       image with a caption underneath (rendered as a <figure>)
Line ending with two spaces␣␣          forces a line break (used in the home "pitch")
> [!NOTE]                              coloured note box (also TIP, IMPORTANT, WARNING, CAUTION)
> Text of the note.
```

Code blocks use three backticks, optionally with a language for colouring: ```` ```bash ````.
HTML is allowed inside Markdown (`unsafe: true` in `hugo.yaml`).

### 3.4 Hugo templates (files in `layouts/`)

Templates are HTML with Hugo instructions inside `{{ … }}`. The main patterns used in this site:

| Syntax | Meaning |
|--------|---------|
| `{{ .Title }}` | The current page’s title. `.` (“dot”) is the *current context* — usually the page. |
| `{{ .Params.lead }}` | A front-matter value of the current page. |
| `{{ site.Params.name }}` | A value from `hugo.yaml` → `params:`. |
| `{{ .Content }}` | The Markdown body of the page, converted to HTML. |
| `{{ hugo.Data.publications }}` | The contents of `data/publications.yaml`. |
| `{{ $x := … }}` / `{{ $x = … }}` | Create / change a variable. `$` alone always means the page the template started with. |
| `{{ with X }} … {{ end }}` | If X exists and is not empty, run the block with `.` set to X. Used everywhere so that empty fields simply disappear. `{{ with X }}…{{ else }}…{{ end }}` adds a fallback. |
| `{{ if A }} … {{ else if B }} … {{ end }}` | Conditions. `and`, `or`, `not`, `eq` (equal), `gt` (greater than) are functions: `{{ if eq .type "visit" }}`. |
| `{{ range LIST }} … {{ end }}` | Loop; inside, `.` is the current item. `{{ range $i, $p := LIST }}` also gives the index `$i` (starts at 0). |
| `X \| f` | Pipe: pass X to the function f. `{{ .text \| markdownify }}` converts Markdown text to HTML. |
| `default` | `{{ .alt \| default "" }}` — use a fallback when the value is empty. |
| `first`, `where`, `sort`, `uniq`, `after` | List tools: `first 3 (where $pubs "selected" true)` = first 3 publications with `selected: true`. |
| `printf` | Build text: `printf "media/pubs/%s" .image` → `media/pubs/traderpros.png`. |
| `dict` / `slice` | Build a map / a list, e.g. to pass several values to a partial. |
| `{{ partial "pub.html" . }}` | Insert the reusable piece `layouts/_partials/pub.html`, giving it `.` as context. |
| `{{ define "main" }} … {{ end }}` | Fills the `{{ block "main" . }}` slot of `layouts/baseof.html` (the page skeleton). |
| `resources.Get "media/icon.png"` | Load a file from `assets/`. `.Resources.Get "photo.jpg"` loads a file from the page’s own folder. |
| `.Resize "300x"`, `.Fit "700x440"`, `.Fill "600x450 smart"` | Image processing: resize to width / fit inside a box / crop to fill a box (`smart` picks the interesting part). Extra words set format and quality: `webp q85`. |
| `.RelPermalink` | The URL of a page or processed image. |
| `relURL` | Make a site-relative link: `{{ "/publications/" \| relURL }}`. |
| `safeHTML`, `safeJS`, `safeCSS` | Tell Hugo the text is trusted code and should not be escaped. |
| `{{- … -}}` | The dashes trim surrounding whitespace in the output (cosmetic only). |
| `{{/* … */}}` | Comment, not shown on the site. |

### 3.5 CSV (map pins)

`pins.csv` is a plain table: first row = column names, one pin per row, values separated by commas.
Text containing a comma must be in double quotes (`"Ithaca, NY"`); a literal double quote is written
twice (`""sector 9""`). Edit in Excel and save as **CSV UTF-8**; semicolon-separated files and decimal
commas (`-19,3`) are also accepted.

### 3.6 CSS (`assets/css/main.css`)

Rules are `selector { property: value; }`. The colours and fonts are **CSS variables** defined once in
`:root { --name: value; }` and used elsewhere as `var(--name)`, so changing a variable changes it
everywhere. `@media (max-width: …)` blocks hold the mobile layout.

---

## 4. Folder-by-folder reference

```
ghfazevedo.github.io/
├── hugo.yaml                 site settings
├── preview.bat               local preview (Windows)
├── README.md / instruction.MD
├── .github/workflows/        automatic publishing
├── assets/                   CSS + images processed by Hugo
├── content/                  all pages
├── data/                     publications and news lists
├── layouts/                  HTML templates (the theme)
├── static/                   files copied unchanged (CV)
└── public/, resources/       generated — ignore
```

### 4.1 Root files

#### `hugo.yaml` — site settings
| Block | What it does |
|-------|--------------|
| `baseURL`, `title`, `locale` | Address and name of the site. |
| `disableKinds` | Turns off pages the site does not use (tag lists, RSS). |
| `removePathAccents` | `Muséum` in a folder name becomes `museum` in the URL. |
| `ignoreFiles` | Regular expressions of files in `content/` that Hugo ignores (`.ai`, `.psd`, `.docx`, `.pptx`, `.txt`, `.ipynb`) — you can keep source files next to pages safely. |
| `markup.goldmark.renderer.unsafe: true` | Allows HTML inside Markdown. |
| `markup.highlight` | Code-block colouring (`style: github`). |
| `markup.tableOfContents` | The `toc: true` box includes `##` and `###` headings. |
| `imaging` | Quality of resized images (JPEG/WebP 82) and resampling filter. |
| `caches.getresource.maxAge` | Remote READMEs are re-downloaded every 30 min in preview. |
| `menus.main` | Top menu. Each item: `name` (text), `pageRef` (page), `weight` (order, smaller first). Delete an item to hide it from the menu (the page still exists). The CV button is added automatically. |
| `params` | Personal information used everywhere: `name`, `author_short` (on the “Ex libris” bookplate), `tagline` (above your name on the home page), `position` (under the pitch; currently empty because the value is commented out), `location` (footer), `description` (default text for search engines/link previews), `email`, `scholar`, `github`, `bluesky` (empty = button/link hidden), `cv`, `me_regex`, `goatcounter`. |

`me_regex` is a regular expression that finds your name in author lists to make it bold:
`'Azevedo, G\.(?:\s?H\.\s?F\.)?\*?'` matches `Azevedo, G.`, `Azevedo, G.H.F.`, `Azevedo, G. H. F.`
and the same followed by `*`. (`\.` = a literal dot, `\s?` = optional space, `(?: … )?` = optional group,
`\*?` = optional asterisk.)

#### `preview.bat`
Windows batch script: checks whether Hugo is installed (`where hugo`), offers to install it with
`winget`, then runs `hugo server --buildDrafts --disableFastRender --navigateToChanged --openBrowser`
(local server, shows drafts, full rebuild on each change, jumps to the page you edited, opens the browser).
Lines starting with `rem` are comments.

#### `.gitignore`, `.gitattributes`
`.gitignore` keeps the generated `public/`, `resources/` and `.hugo_build.lock` out of git.
`.gitattributes` normalises line endings between Windows and Linux.

#### `LICENSE`, `LICENSE.md`, `.github/FUNDING.yml`
Licence text and GitHub’s sponsor-button configuration; not used by the website itself.

### 4.2 `.github/workflows/publish.yaml` — automatic publishing

A GitHub Actions workflow (YAML):
* `on:` — runs on every push to `main`, manually (`workflow_dispatch`, “Run workflow” button in the
  Actions tab), and daily at 09:17 UTC (`cron: "17 9 * * *"`) so tutorials pulled from GitHub READMEs stay current.
* `env: HUGO_VERSION` — the Hugo version used online. If the local preview works but the online build
  fails, compare it with your local version (`hugo version`).
* `jobs: build` — checks out the repository, installs Hugo extended, runs
  `hugo --gc --minify` (clean up unused files, compress HTML/CSS) and uploads `public/`.
* `jobs: deploy` — publishes the uploaded folder to GitHub Pages.

### 4.3 `assets/` — files processed by Hugo

| File | Used for |
|------|----------|
| `css/main.css` | The whole design. Minified and fingerprinted (cache-busted) on the published site. |
| `media/avatar.jpg` | Round portrait on the home page; fallback photo for the About page. (`avatar-original.jpeg` is just a backup.) |
| `media/icon.png` | Emblem: large on the home page, header logo, footer, favicon, link-preview image. |
| `media/icon-ink.png` | Ink version: “Ex libris” bookplate, 404 page, placeholder when a tile/publication has no image. |
| `media/oldmanuscript.png` | Paper texture used as background (CSS variable `--manuscript`). |
| `media/pubs/` | Publication thumbnails, referenced by `image:` in `data/publications.yaml`. |
| `media/news/` | News photos, referenced by `image:` in `data/news.yaml`. |

To replace an image, keep the same file name (or update the reference). Any size works; Hugo resizes.

**`css/main.css` structure.** The `:root` block at the top holds the design tokens:
`--bg` (page), `--band` (alternate section background), `--ink`/`--ink-2`/`--ink-3` (text),
`--sepia` (metadata), `--rule`/`--rule-2` (lines), `--link`/`--link-hover` (teal links),
`--p1`/`--p2`/`--p3` (colours of research programs 1–3), `--serif`/`--sans`/`--mono` (fonts),
`--wrap` (maximum content width). The rest of the file is organised by commented blocks
(`/* ── Header ── */`, `/* ── Buttons ── */`, …), each styling the classes used in the templates
(`.hero`, `.card`, `.tile`, `.pub`, `.gallery`, `.fieldmap`…).
Fonts are loaded from Google Fonts in `layouts/_partials/head.html`; to change a font, change both the
link there and the variable here.

### 4.4 `content/` — the pages

#### 4.4.1 `content/_index.md` — home page
Front matter:
* `name_lines` — how your name is split over lines in the big title (`[Guilherme, Azevedo]`).
* `pitch` — the text under your name (`|` keeps line breaks; end a line with two spaces to force a break).
* `path` — list of `years` + `place` for the “Path” column in the About band (most recent first).

Body (after the second `---`): the short **About** paragraph on the home page.
Everything else on the home page is assembled automatically: research cards (from
`content/research/_index.md`), 3 selected publications, 5 news items, contact buttons (from `hugo.yaml`).

#### 4.4.2 `content/research/_index.md` — Research page
* `lead` — introduction. It contains a numbered list with links `[…](#program-1)` that jump to each program
  (anchors `program-1`, `program-2`, `program-3` are created automatically in program order).
* `programs` — list of programs. For each: `title`, `image` (file in this folder), `summary` (short text
  on the home-page card), `text` (longer text on the Research page, Markdown allowed), optional `alt`
  (image description). The order sets the numbering and the colour (`--p1`, `--p2`, `--p3`).
* `build: publishResources: false` — keeps original figures/Word files here off the public site.
* Body — closing paragraph shown under the programs.

#### 4.4.3 `content/publications/_index.md`
Only the title and the intro sentence (body). The list itself comes from `data/publications.yaml`.

#### 4.4.4 `content/teaching/` and `content/codes/`
`_index.md` holds the `title` and `lead` of the landing page; each subfolder is one tile. The tile shows
`featured.png`/`.jpg` (or the ink emblem if missing), `label`, `title`, `summary`, `link_text`;
tiles are ordered by `weight`.

Three ways to make an item:

1. **External link** (all current Codes): `external_link:` → the tile opens that URL; no page body needed.
2. **Page written here** (e.g. `teaching/phylogenomics-en/`): write the tutorial in Markdown below the
   front matter. Put images in the same folder (or an `images/` subfolder) and reference them as
   `![](images/fig.jpg)`. `toc: true` adds a contents box.
3. **README from GitHub** (`teaching/sedhisse/`, `teaching/traderpros/`):
   `readme: https://raw.githubusercontent.com/OWNER/REPO/BRANCH/path/README.md`.
   The file is downloaded at every build — **edit it on GitHub, not here**. Its first `# Title` is removed
   (the page already has a title), relative images/links are redirected to GitHub, and a contents box is
   built if `toc: true`. If GitHub is unreachable, the page shows a link to the repository instead.

**Bilingual tutorials** (`Phylogenomics` + `phylogenomics-en`, `species-delimitation` +
`species-delimitation-en`): each version has `lang_label` (its own language) and `translations`
(a list of `label` + `url` of the other versions) → a language switch appears under the title.
The Portuguese versions have `build: list: never`, so only the English version gets a tile.
The English versions use `resources_from: /teaching/…` to borrow the images stored in the Portuguese
folder, so images are not duplicated.

Source files like `.docx`, `.pptx`, `.ai` can stay in these folders; `hugo.yaml` → `ignoreFiles` keeps them
off the site.

#### 4.4.5 `content/fieldwork/` and `content/museums/` — map + albums
Both use the same template (`layouts/_partials/map-albums.html`).

* `pins.csv` — map pins. Columns:
  `title, lat, lon, year, type, album, note, precision`
  * `lat`/`lon` in decimal degrees (Google Maps: right-click a spot → click the numbers to copy).
  * `type` — must match a key under `pin_types` in `_index.md`; sets the colour.
  * `album` — optional folder name of an album; the pin gets a “See photos ↓” link and the album gets
    “● on the map”.
  * `note` — optional text in the pin pop-up (Markdown allowed).
  * `precision` — write `approx` for sensitive localities: coordinates are rounded to 0.1° (~10 km)
    **before** they reach the web page, and the pin is drawn as a dashed circle.
  Rows without `lat`/`lon` are skipped.
* `_index.md`:
  * `lead` — intro text.
  * `pin_types` — one entry per pin type: `key: { label: Legend text, color: "#hex" }`. Comment out a
    line with `#` to remove a type from the legend.
  * `albums` — list (newest first). Each: `title`, `place`, `year`, `folder` (subfolder with the photos),
    optional `text`, `credits`, and optional `photos` (list of `file` + `caption` to choose order and add
    captions; without it, every image in the folder is shown).
  * `build: publishResources: false` — the CSV with exact coordinates and the original photos are not
    published; only the resized photos and the rounded pins are.
* Album folders (e.g. `Chile-2018/`, `cas-2014/`) — just photos. Phone photos are auto-rotated
  (`images.AutoOrient`). Other files (e.g. the `expedition_database.*` in `Utah-Nevada-2021/`) are ignored.

The map uses Leaflet with Esri topographic tiles and clusters nearby pins; the scroll wheel zooms only
after the map is clicked.

#### 4.4.6 `content/outreach/`
Like the albums above but without a map: `_index.md` has `lead` and a list `events` (`title`, `place`,
`year`, `folder`, optional `text`, `credits`, `photos`). One subfolder of photos per event. The body
(under the second `---`) is an optional introduction (currently an HTML comment `<!-- … -->`, which is invisible).

#### 4.4.7 `content/about_me/_index.md`
* `lead` — line under the title.
* `photo` — file in this folder shown beside the text (empty → home-page portrait); `photo_caption`,
  optional `photo_alt`.
* `gallery` — list of `file` + `caption` shown under the text (`gallery_title` adds a heading). Without a
  `gallery:` list, every image in a `gallery/` subfolder is shown instead.
* Body — the About text. Empty lines separate paragraphs.

### 4.5 `data/` — lists used by templates

#### `data/publications.yaml`
One block per paper; order in the file does not matter for the Publications page (grouped by year,
newest first, with **In review** on top), but it does for the home page (first 3 `selected: true`).

| Field | Notes |
|-------|-------|
| `title` | Quoted; use `*Genus species*` for italics. |
| `authors` | As in the CV; your name is bolded via `me_regex`. Use `*` for equal contribution. |
| `year`, `journal` | Required. |
| `volume` | Free text, e.g. `"80: 1243–1263"`. |
| `status` | e.g. `in review`; present → listed under *In review*. Remove when published. |
| `doi` | Only the DOI (`10.1093/evolut/qpag049`); the title links to `https://doi.org/…`. |
| `preprint`, `pdf`, `code`, `data` | Optional link buttons. The title links to the DOI, otherwise to the preprint. `pdf` can be a file in `static/` (e.g. `/uploads/paper.pdf`). |
| `image` | Thumbnail in `assets/media/pubs/`. |
| `selected` | `true` → candidate for the home page. |

#### `data/news.yaml`
Newest first; the home page shows the first 5. Fields: `date` (any text), `text` (Markdown; quote it
if it starts with `[` or `*`), optional `image` (in `assets/media/news/`) and `alt`. Clicking a news image
opens it enlarged.

### 4.6 `layouts/` — the theme (templates)

You rarely need to edit these. Map of what each file renders:

| File | Renders |
|------|---------|
| `baseof.html` | Skeleton of every page: `<head>`, header, `<main>` with the `main` block, footer. |
| `home.html` | Home page: hero (portrait, name, pitch, buttons, emblem), research cards, selected publications, news, About band with bookplate and Path. |
| `section.html` | Generic section page (Teaching, Codes): title, `lead`, body, then tiles of the child pages sorted by `weight`. |
| `page.html` | Generic single page (tutorials): `label`, title, language switch, `lead`, then either the remote README or the Markdown body with optional contents box. |
| `404.html` | “Page not found”. |
| `research/section.html` | Research page: one block per item in `programs`. |
| `publications/section.html` | Publications page: splits `data/publications.yaml` into *In review* (`where … "status" "!=" nil`) and published, then groups the latter by year. |
| `fieldwork/section.html`, `museums/section.html` | One line each: `{{ partial "map-albums.html" . }}`. |
| `outreach/section.html` | Outreach events and galleries. |
| `about_me/section.html` | About page: photo + text + gallery. |
| `_partials/head.html` | `<title>`, description, favicon, link-preview (Open Graph) tags, Google Fonts, CSS, analytics. |
| `_partials/header.html` | Sticky top bar: logo + name, menu from `hugo.yaml`, CV button, mobile menu toggle. |
| `_partials/footer.html` | Footer: emblem, name · location, contact links, © year. |
| `_partials/contact-buttons.html` | CV / Google Scholar / GitHub / Email buttons (each hidden if its param is empty). |
| `_partials/icon.html` | Small SVG icons: `{{ partial "icon.html" "download" }}` (also `scholar`, `github`, `mail`, `menu`). |
| `_partials/pub.html` | One publication entry (thumbnail, title link, bolded authors, journal, link buttons). |
| `_partials/thumb.html` | Publication thumbnail or ink-emblem placeholder. |
| `_partials/tile.html` | One Teaching/Codes tile. |
| `_partials/map-albums.html` | Fieldwork/Museums: reads `pins.csv`, rounds `approx` pins, draws the Leaflet map and the albums. |
| `_partials/lightbox.html` | Click-to-enlarge photo viewer for links with class `gal-link`. |
| `_partials/remote-readme.html` | Downloads and displays a GitHub README (`readme:`). |
| `_partials/analytics.html` | GoatCounter script, only on the published site (`hugo.IsProduction`). |
| `_markup/render-image.html` | How Markdown images `![…](…)` are rendered: finds files in the page folder (or `resources_from`), adds a caption if a title is given. |
| `_markup/render-blockquote.html` | Turns `> [!NOTE]`-style blockquotes into coloured boxes. |

A worked example — the selected publications on the home page (`home.html`):
```go-html-template
{{ range first 3 (where $pubs "selected" true) }}        {{/* loop over first 3 selected papers   */}}
  {{- $url := "" }}                                       {{/* start with no link                  */}}
  {{ with .doi }}{{ $url = printf "https://doi.org/%s" . }} {{/* DOI → link                       */}}
  {{ else }}{{ with .preprint }}{{ $url = . }}{{ end }}{{ end }} {{/* else preprint → link         */}}
  {{ partial "thumb.html" (dict "img" .image) }}           {{/* thumbnail (or placeholder)          */}}
  <a href="{{ $url | default "/publications/" }}">{{ .title | markdownify }}</a>
  <i>{{ .journal }}</i> · {{ .status | default .year }}    {{/* "in review" or the year           */}}
{{ end }}
```

A second example — how a research card picks its image (`home.html`):
```go-html-template
{{ with $research.Resources.Get $p.image }}            {{/* file named in "image:" in content/research/ */}}
  <img src="{{ (.Fit "700x440 webp q85").RelPermalink }}">  {{/* resized to fit 700×440, WebP, quality 85 */}}
{{ end }}                                               {{/* no file → nothing is shown, no error    */}}
```

### 4.7 `static/` — files copied unchanged
Everything in `static/` is published at the same path without processing:
`static/uploads/GHFA_CV_09_2026.pdf` → `https://ghfazevedo.github.io/uploads/GHFA_CV_09_2026.pdf`.
Use it for PDFs and other downloads. Old CVs can be deleted once `cv:` points to the new one.

### 4.8 `public/`, `resources/`, `.hugo_build.lock` — generated
Output of Hugo (the built site, the cache of resized images, a lock file). Not in git; safe to delete
if something looks stale — they are recreated at the next preview/build.

---

## 5. Troubleshooting

| Symptom | Likely cause / fix |
|---------|--------------------|
| Preview window shows an error with a file name and line number | Usually YAML: a tab instead of spaces, a missing quote around text containing `:` or starting with `*`/`[`, or a misaligned `-`. Go to that line. |
| A field I added does not appear | Check the spelling of the key and its indentation; empty values are hidden on purpose. |
| A photo/figure does not appear | File name must match exactly (including upper/lower case: `.JPG` ≠ `.jpg` online). Check it is in the right folder (`assets/media/pubs/`, `assets/media/news/`, the page folder or the album `folder`). |
| A new tile does not appear | `draft: true` (preview only), `build: list: never`, or the file is named `_index.md` instead of `index.md`. |
| A pin does not appear on the map | Missing/invalid `lat`/`lon`, or the CSV was saved in a non-UTF-8 format. |
| A pin has the default teal colour | Its `type` does not match a key in `pin_types`. |
| A README tutorial is outdated | It updates at the next build (daily, or push / “Run workflow” in GitHub Actions). |
| The published site did not change | Check the *Actions* tab on GitHub for a failed run; the log names the problem. Browser cache: reload with Ctrl+F5. |
| Strange leftovers in the preview | Close the preview, delete `public/` and `resources/`, run `preview.bat` again. |
