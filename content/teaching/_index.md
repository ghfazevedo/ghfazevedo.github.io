---
title: Teaching
summary: Materials from courses I taught
type: landing

cascade:
  - _target:
      kind: page
    params:
      show_breadcrumb: true

design:
  #css_class: bright
  background:
    color: white
    # Text color (true=light, false=dark, or remove for the dynamic theme color).
    #text_color_light: true
    image:
      # Add your image background to `assets/media/`.
      filename: oldmanuscript.png
      filters:
        brightness: 1.0
      size: cover
      position: center
      parallax: false

sections:
  - block: collection
    id: teaching
    content:
      title: Teaching
      filters:
        folders:
          - teaching
    design:
      view: article-grid
      columns: 2
---
