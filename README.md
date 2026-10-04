# ghfazevedo.github.io

Personal website of Guilherme Azevedo, built with [Hugo](https://gohugo.io) and a small custom theme.
Publishing is automatic: every push to `main` rebuilds the site on GitHub Pages.

## Preview on your computer
Double-click **`preview.bat`**. The browser opens at <http://localhost:1313> and refreshes every time you save a file.
(The first time, it offers to install Hugo with `winget`.)

## Where things are

| To change…                               | Edit                                                                 |
|------------------------------------------|----------------------------------------------------------------------|
| Name, position, links, CV file, analytics| `hugo.yaml` → `params:`                                              |
| Home: pitch, About text, “Path” list     | `content/_index.md`                                                  |
| Research programs (cards + page)         | `content/research/_index.md` (figures in the same folder)            |
| Publications                             | `data/publications.yaml` (figures in `assets/media/pubs/`)           |
| News                                     | `data/news.yaml`                                                     |
| Teaching / Codes tiles                   | one folder per item in `content/teaching/` or `content/codes/`, with `index.md` + `featured.png/jpg` |
| About me page                            | `content/about_me/_index.md`                                         |
| Portrait / emblem                        | `assets/media/avatar.jpg`, `icon.png`, `icon-ink.png`                |
| Colours and fonts                        | top of `assets/css/main.css`                                         |

### Add a publication
Copy one block in `data/publications.yaml` and edit it. Your name is put in bold automatically.
Optional thumbnail: save a small figure in `assets/media/pubs/` and write its file name in `image:`.
Add `selected: true` to show it on the home page.

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

### Update the CV
Put the PDF in `static/uploads/` and change `cv:` in `hugo.yaml`.

## Visitor statistics
The site uses [GoatCounter](https://www.goatcounter.com) (free, no cookies). Create an account, choose a code,
and write it in `hugo.yaml` → `goatcounter:`. Your dashboard is at `https://<code>.goatcounter.com` (private, login required).
Local previews are never counted.
